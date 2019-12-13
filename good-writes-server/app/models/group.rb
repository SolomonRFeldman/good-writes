class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :comments
  has_many :pieces, through: :comments
  belongs_to :piece, optional: true

  validates :name, presence: true

  def show_attributes
    user_groups = self.user_groups.select(:id, :alias).order(:created_at)
    self.attributes.merge({ featured_piece: self.featured_piece, user_groups: user_groups })
  end

  def featured_piece
    if piece = featured_piece_search[self.point_in_cycle]
      piece
    else
      update(point_in_cycle: 0)
      featured_piece_search[self.point_in_cycle]
    end
  end

  class << self

    def new_with_join(attributes)
      user_group = UserGroup.new(user_id: attributes[:user_id], alias: attributes[:alias], moderator_status: true)
      Group.new(name: attributes[:name], form: attributes[:form], user_groups: [user_group])
    end

  end

  private

  def featured_piece_search
    Piece.joins("RIGHT JOIN user_groups ON user_groups.piece_id = pieces.id")
    .select(featured_piece_select)
    .order("user_groups.created_at")
    .where("user_groups.group_id = ?", self.id)
  end

  def featured_piece_select
    <<~SQL
      user_groups.alias,
      pieces.id,
      pieces.user_id,
      pieces.title,
      pieces.form,
      pieces.content
    SQL
  end

end
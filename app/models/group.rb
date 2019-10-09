class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :comments
  has_many :pieces, through: :comments
  belongs_to :piece, optional: true

  validates :name, presence: true

  def featured_piece
    if piece = featured_piece_search[self.point_in_cycle]
      piece if piece.id
    else
      update(point_in_cycle: 0)
      featured_piece_search[self.point_in_cycle]
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
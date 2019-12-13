class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :piece, optional: true
  validates :user_id, uniqueness: { scope: [:group_id] }

  before_save do
    if self.alias == nil or self.alias == ""
      self.alias = self.user.username
    end
  end

  after_destroy do
    self.group.destroy if self.group.user_groups.empty?
  end

  def show_attributes
    self.attributes.merge({ valid_pieces: self.valid_pieces })
  end

  def valid_pieces
    Piece.joins("FULL JOIN groups ON groups.form = pieces.form")
      .select("pieces.*")
      .order("pieces.updated_at")
      .where('groups.id = ? AND pieces.user_id = ?', self.group_id, self.user_id)
  end

end
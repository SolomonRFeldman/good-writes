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

end
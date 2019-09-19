class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  before_save do
    if self.alias == nil or self.alias == ""
      self.alias = self.user.username
    end
  end

end
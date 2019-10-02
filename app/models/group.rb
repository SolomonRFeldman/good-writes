class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :comments
  belongs_to :piece, optional: true

end
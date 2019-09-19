class User < ApplicationRecord
  has_secure_password

  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :username, :email, presence: true
  validates :email, uniqueness: { case_sensative: false }
  
end
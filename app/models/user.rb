class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: { case_sensative: false }
  
end
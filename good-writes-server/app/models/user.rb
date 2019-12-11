class User < ApplicationRecord
  has_secure_password validations: false

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :pieces, -> { order('updated_at DESC') }
  has_many :comments

  validates :username, presence: true
  validates :email, uniqueness: { case_sensative: false }, unless: :auth_id

  validates :email, :password, presence: true, unless: :auth_id
  validates :password, confirmation: true

  def self.oauth_login(auth)
    user = User.find_or_create_by(auth_id: auth.uid) do |u|
      u.auth_id = auth.uid
      u.username = auth.info.name
    end
  end
  
end
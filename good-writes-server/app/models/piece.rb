class Piece < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :groups, through: :comments

  validates :title, :content, presence: true
  validates :form, inclusion: { in: %w(Poetry Fiction Non-Fiction) }


end
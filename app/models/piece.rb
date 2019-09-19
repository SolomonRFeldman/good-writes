class Piece < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :content, presence: true
  validates :form, inclusion: { in: %w(Poetry Fiction Non-Fiction) }


end
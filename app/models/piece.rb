class Piece < ApplicationRecord
  validates :title, :content, presence: true
  validates :form, inclusion: { in: %w(Poetry Fiction Non-Fiction) }


end
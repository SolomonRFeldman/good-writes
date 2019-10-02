class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :comments
  belongs_to :piece, optional: true

  def featured_piece
    if user_group = user_groups.order(:created_at)[self.point_in_cycle]
      user_group.piece
    else
      update(point_in_cycle: 0)
      user_groups.order(:created_at)[self.point_in_cycle].piece
    end
  end

end
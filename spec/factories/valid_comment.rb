FactoryBot.define do

  factory :valid_comment, class: Comment do
    piece_id { valid_piece.id }
    user_id { valid_user.id }
    group_id { valid_group.id }
    content { "Pretty good" }
  end

end
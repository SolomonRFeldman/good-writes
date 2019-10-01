FactoryBot.define do

  factory :valid_comment, class: Comment do
    association :user, factory: :valid_user
    association :group, factory: :valid_group
    association :piece, factory: :valid_piece
    content { "Pretty good" }
  end

end
FactoryBot.define do

  factory :valid_user, class: User do
    username { 'Test' }
    email { 'Test@123.com' }
    password { '123' }
  end

end
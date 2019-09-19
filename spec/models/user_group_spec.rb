require 'rails_helper'

RSpec.describe UserGroup, :type => :model do
  let(:valid_group) {
    Group.create(
      name: "Sunshine Friends",
      form: "Poetry",
      private: false
    )
  }

  let(:valid_user) { 
    User.create(
      :username => "Test",
      :email => "Test@123.com",
      :password => "123"
    )
  }

  it "belongs to a user and a group" do
    user_group = UserGroup.new
    user_group.user = valid_user
    user_group.group = valid_group
    expect(user_group.user).to eq(valid_user)
    expect(user_group.group).to eq(valid_group)
  end


  

end
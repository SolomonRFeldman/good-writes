require 'rails_helper'

RSpec.describe Group, :type => :model do
  include_context "create_all"

  let(:user_1) { 
    User.create(
      :username => "Test",
      :email => "Test@123.com",
      :password => "123"
    )
  }

  let(:user_2) { 
    User.create(
      :username => "Hello",
      :email => "Hello@Hush.com",
      :password => "hush"
    )
  }

  it "is valid with name, form, and private set" do
    expect(valid_group).to be_valid
  end

  it "has many users" do
    valid_group.users << user_1
    valid_group.users << user_2
    expect(valid_group.users).to eq([user_1, user_2])
  end

  it "has many comments" do
    valid_comment
    other_comment = Comment.create(user_id: valid_user.id, piece_id: valid_piece.id, group_id: valid_group.id, content: "It's alright I suppose.")
    expect(valid_group.comments).to eq([valid_comment, other_comment])
  end

end
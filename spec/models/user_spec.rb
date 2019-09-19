require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_user) { 
    User.create(
      :username => "Test",
      :email => "Test@123.com",
      :password => "123"
    )
  }
  
  let(:hush_hash) { 
    {
      :username => "Hello",
      :email => "Hello@Hush.com",
      :password => "hush"
    }
  }

  let(:group_1) {
    Group.create(
      name: "Sunshine Friends",
      form: "Poetry",
      private: false
    )
  }

  let(:group_2) {
    Group.create(
      name: "Stories with Trees",
      form: "Non-Fiction",
      private: false
    )
  }

  let(:piece_1) {
    Piece.create(
      title: "Sunshine Land",
      content: "There once was a sunny land.",
      form: "Fiction"
    )
  }

  let(:piece_2) {
    Piece.create(
      title: "My Little Poem",
      content: "Yeah",
      form: "Poetry"
    )
  }

  it "is valid with username, email, and password" do 
    expect(valid_user).to be_valid
  end

  it "encryptes password" do
    expect(valid_user.password_digest).to_not eq("123")
  end

  it "is invalid with a blank username" do
    expect(User.new(hush_hash.merge(username: ""))).to_not be_valid
  end

  it "is invalid with a blank password" do
    expect(User.new(hush_hash.merge(password: ""))).to_not be_valid
  end

  it "is invalid with a blank email" do
    expect(User.new(hush_hash.merge(email: ""))).to_not be_valid
  end

  it "is invalid with a non-unique email" do
    valid_user
    expect(User.new(hush_hash.merge(email: "Test@123.com"))).to_not be_valid
  end

  it "is invalid with a different case non-unique email" do
    valid_user
    expect(User.new(hush_hash.merge(email: "test@123.com"))).to_not be_valid
  end

  it "has many groups" do
    valid_user.groups << group_1
    valid_user.groups << group_2
    expect(valid_user.groups).to eq([group_1, group_2])
  end

  it "has many pieces" do
    valid_user.pieces << piece_1
    valid_user.pieces << piece_2
    expect(valid_user.pieces).to eq([piece_1, piece_2])
  end

end
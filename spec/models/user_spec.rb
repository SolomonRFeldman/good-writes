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

end
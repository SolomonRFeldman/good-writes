require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { 
    User.create(
      :username => "Test",
      :email => "Test@123.com",
      :password => "123"
    )
  }
  
  it "is valid with username, email, and password" do 
    expect(user).to be_valid
  end

  it "encryptes password" do
    expect(user.password_digest).to_not eq("123")
  end

  it "is invalid with a blank username" do
    expect(User.new(username: "", email: "Test@123.com", password: "123")).to_not be_valid
  end

  it "is invalid with a blank password" do
    expect(User.new(username: "Test", email: "Test@123.com", password: "")).to_not be_valid
  end

  it "is invalid with a blank email" do
    expect(User.new(username: "Test", email: "", password: "123")).to_not be_valid
  end

  it "is invalid with a non-unique email" do
    expect(User.new(username: "Test", email: "Test@123.com", password: "123")).to_not be_valid
  end

end
require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { 
    User.create(
      :username => "Test",
      :password => "123"
    )
  }
  
  it "is valid with username and password" do 
    expect(user).to be_valid
  end

  it "encryptes password" do
    expect(user.password_digest).to_not eq("123")
  end

end
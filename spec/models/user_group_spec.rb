require 'rails_helper'

RSpec.describe UserGroup, :type => :model do
  include_context "create_all"

  it "is valid with valid user and group" do
    expect(UserGroup.new(user_id: valid_user.id, group_id: valid_group.id)).to be_valid
  end

  it "belongs to a user and a group" do
    user_group = UserGroup.new
    user_group.user = valid_user
    user_group.group = valid_group
    expect(user_group.user).to eq(valid_user)
    expect(user_group.group).to eq(valid_group)
  end

  it "cannot be made without a user_id" do
    expect(UserGroup.new(group_id: valid_group.id)).to_not be_valid
  end

  it "cannot be made without a group id" do
    expect(UserGroup.new(user_id: valid_user.id)).to_not be_valid
  end

  it "defaults alias to username" do
    user_group = UserGroup.new
    user_group.user = valid_user
    user_group.group = valid_group
    user_group.save
    expect(user_group.alias).to eq(valid_user.username)
  end

  it "defaults moderator_status to false" do
    user_group = UserGroup.new
    user_group.user = valid_user
    user_group.group = valid_group
    user_group.save
    expect(user_group.moderator_status).to eq(false)
  end


  

end
require 'rails_helper'

RSpec.describe UserGroup, :type => :model do
  let(:valid_user) { create(:valid_user) }
  let(:valid_group) { create(:valid_group) }
  let(:user_group) { UserGroup.new }

  it "is valid with valid user and group" do
    expect(UserGroup.new(user_id: valid_user.id, group_id: valid_group.id)).to be_valid
  end

  context "when it is assigned to a user and a group" do
    before do
      user_group.user = valid_user
      user_group.group = valid_group
    end
    it "belongs to a user and a group" do
      expect(user_group.user).to eq(valid_user)
      expect(user_group.group).to eq(valid_group)
    end
  end

  it "cannot be made without a user_id" do
    expect(UserGroup.new(group_id: valid_group.id)).to_not be_valid
  end

  it "cannot be made without a group id" do
    expect(UserGroup.new(user_id: valid_user.id)).to_not be_valid
  end

  context "when it saves with no alias provided" do
    before do
      user_group.user = valid_user
      user_group.group = valid_group
      user_group.save
    end
    it "defaults the alias to the user's username" do
      expect(user_group.alias).to eq(valid_user.username)
    end
  end

  context "when it gets destroyed as the last user_group in a group" do
    before do
      user_group.user = valid_user
      user_group.group = valid_group
      user_group.save
      user_group.destroy
    end
    it "destroys the group" do
      expect(valid_group).to be_destroyed
    end
  end

end
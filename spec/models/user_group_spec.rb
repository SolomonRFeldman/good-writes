require 'rails_helper'

RSpec.describe UserGroup, :type => :model do
  let(:valid_user) { create(:valid_user) }
  let(:valid_group) { create(:valid_group) }
  let(:user_group) { UserGroup.create(user_id: valid_user.id, group_id: valid_group.id) }
  let(:valid_piece) { create(:valid_piece, user_id: valid_user.id) }

  it "is valid with valid user and group" do
    expect(UserGroup.new(user_id: valid_user.id, group_id: valid_group.id)).to be_valid
  end

  context "when it is assigned to a user and a group" do
    before do
      user_group
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
      user_group
    end
    it "defaults the alias to the user's username" do
      expect(user_group.alias).to eq(valid_user.username)
    end
  end

  context "when it gets destroyed as the last user_group in a group" do
    before do
      user_group
      user_group.destroy
    end
    it "destroys the group" do
      expect(Group.find_by(id: valid_group.id)).to be_nil
    end
  end

  context "when a piece is prepared" do
    before do
      user_group.piece = valid_piece
    end

    it "has a prepared piece" do
      expect(user_group.piece).to eq(valid_piece)
    end
  end

end
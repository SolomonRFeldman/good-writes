require 'rails_helper'

RSpec.describe Group, :type => :model do
  let(:user_1) { create(:valid_user) }
  let(:user_2) do
    create(
      :valid_user,
      :username => "Hello",
      :email => "Hello@Hush.com",
      :password => "hush"
    )
  end
  let(:valid_group) { create(:valid_group) }
  let(:comment_1) { create(:valid_comment, group_id: valid_group.id, user_id: user_1.id) }
  let(:comment_2) { create(:valid_comment, group_id: valid_group.id, user_id: user_2.id) }
  let(:valid_piece) { create(:valid_piece, user_id: user_1.id) }

  it "is valid with name, form, and private set" do
    expect(valid_group).to be_valid
  end

  it "defaults point_in_cycle to 0 on creation" do
    expect(valid_group.point_in_cycle).to eq(0)
  end

  context "when a group has many users" do
    before do
      valid_group.users << user_1
      valid_group.users << user_2
    end 
    it "can call them" do
      expect(valid_group.users).to eq([user_1, user_2])
    end
  end

  context "when a group has many comments associated" do
    before do
      comment_1
      comment_2
    end
    it "can call them" do
      expect(valid_group.comments).to eq([comment_1, comment_2])
    end
  end

  context "when a group calls on featured piece using it's point in cycle to point to a user_group by creation order" do
    let(:valid_piece_1) { create(:valid_piece, user_id: user_1.id) }
    let(:valid_piece_2) { create(:valid_piece, user_id: user_2.id) }
    let(:user_group_1) { UserGroup.create(user_id: user_1.id, group_id: valid_group.id, piece_id: valid_piece_1.id) }
    let(:user_group_2) { UserGroup.create(user_id: user_2.id, group_id: valid_group.id, piece_id: valid_piece_2.id) }
    before do
      user_group_1
      user_group_2
      valid_group.update(point_in_cycle: 1)
    end

    it "grabs the proper user_group prepared piece" do
      expect(valid_group.featured_piece["id"]).to eq(valid_piece_2.id)
    end

    context "when the point in cycle is out of bounds" do
      before do
        valid_group.update(point_in_cycle: 2)
      end

      it "resets the cycle and pulls the first piece" do
        expect(valid_group.featured_piece["id"]).to eq(valid_piece_1.id)
        expect(valid_group.point_in_cycle).to eq(0)
      end
    end

    context "when there is no prepared piece" do
      before do
        user_group_2.update(piece_id: nil)
      end

      it "returns nil" do
        expect(valid_group.featured_piece["id"]).to be_nil
      end
    end
      
  end

end
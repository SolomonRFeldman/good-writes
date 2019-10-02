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

end
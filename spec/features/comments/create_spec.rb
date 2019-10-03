require 'rails_helper'

describe 'Comment Features', :type => :feature do
  let(:user_1) { create(:valid_user) }
  let(:user_2) { create(:valid_user, :username => "Hello", :email => "Hello@Hush.com", :password => "hush") }
  let(:valid_piece) { create(:valid_piece, user_id: user_1.id) }
  let(:valid_group) { create(:valid_group) }
  let(:user_group_1) { UserGroup.create(user_id: user_1.id, group_id: valid_group.id, piece_id: valid_piece.id) }
  let(:user_group_2) { UserGroup.create(user_id: user_2.id, group_id: valid_group.id) }
  context "when a user types a comment and submits it" do
    before do
      user_group_1
      user_group_2
      login_user(user_2)
      visit group_path(valid_group)
      fill_in "comment[content]", with: "Very good user one, very good."
      click_button "Add Comment"
    end

    it "creates the comment" do
      expect(Comment.all.last.content).to eq('Very good user one, very good.')
    end
  end

end
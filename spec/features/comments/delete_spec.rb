require 'rails_helper'

describe 'Comment Features', :type => :feature do
  let(:user_1) { create(:valid_user) }
  let(:user_2) { create(:valid_user, :username => "Hello", :email => "Hello@Hush.com", :password => "hush") }
  let(:valid_piece_1) { create(:valid_piece, user_id: user_1.id) }
  let(:valid_piece_2) { create(:valid_piece, user_id: user_2.id) }
  let(:valid_group) { create(:valid_group) }
  let(:user_group_1) { UserGroup.create(user_id: user_1.id, group_id: valid_group.id, piece_id: valid_piece_1.id) }
  let(:user_group_2) { UserGroup.create(user_id: user_2.id, group_id: valid_group.id, piece_id: valid_piece_2.id) }

  before do
    user_group_1
    user_group_2
    login_user(user_2)
    Comment.create(user_id: user_2.id, group_id: valid_group.id, piece_id: valid_piece_1.id, author_alias: "Boo", content: "Goood")
  end

  context "when a user creates a comment, goes to the group show page, and clicks the delete button" do
    before do
      visit group_path(valid_group)
      click_button 'Delete'
    end

    it "it deletes the comment" do
      expect(Comment.all.last).to be_nil
    end

    it "redirects to the group show" do
      expect(page.current_path).to eq(group_path(valid_group))
    end
  end

  context "when someone who is not the creator goes to the group show page" do
    before do
      login_user(user_1)
      visit group_path(valid_group)
    end

    it "doesn't show a delete button" do
      expect{ click_button 'Delete' }.to raise_error(Capybara::ElementNotFound)
    end
  end

  context "when someone who is not the creator submits a delete request" do
    before do
      login_user(user_1)
      page.driver.submit :delete, group_comment_path(valid_group, Comment.all.last), comment: { content: "Very good user one, very good." }
    end

    it "does not delete it" do
      expect(Comment.all.last.content).to_not be_nil
    end
  end


end
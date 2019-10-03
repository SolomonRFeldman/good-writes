require 'rails_helper'

describe 'Comment Features', :type => :feature do
  let(:user_1) { create(:valid_user) }
  let(:user_2) { create(:valid_user, :username => "Hello", :email => "Hello@Hush.com", :password => "hush") }
  let(:valid_piece_1) { create(:valid_piece, user_id: user_1.id) }
  let(:valid_piece_2) { create(:valid_piece, user_id: user_2.id) }
  let(:valid_group) { create(:valid_group) }
  let(:user_group_1) { UserGroup.create(user_id: user_1.id, group_id: valid_group.id, piece_id: valid_piece_1.id) }
  let(:user_group_2) { UserGroup.create(user_id: user_2.id, group_id: valid_group.id, piece_id: valid_piece_2.id) }

  context "when a user creates a comment" do
    before do
      user_group_1
      user_group_2
      login_user(user_2)
      comment = Comment.create(user_id: user_2.id, group_id: valid_group.id, piece_id: valid_piece_1.id, author_alias: "Boo", content: "Goood")
      visit group_path(valid_group)
    end
    it "displays the comment on the group show" do
      expect(page).to have_content('Goood')
    end

    it "displays the comment's stored alias" do
      expect(page).to have_content('Boo')
    end

    context "when the group cycles to the next piece" do
      before do
        valid_group.update(point_in_cycle: 1)
        visit group_path(valid_group)
      end

      it "no longer shows up" do
        expect(page).to_not have_content('Goood')
      end
    end

    context "when there are already comments on the piece from another group" do
      let(:another_group) { create(:valid_group) }
      before do
        Comment.create(user_id: user_2.id, group_id: another_group.id, piece_id: valid_piece_1.id, author_alias: "Boof", content: "Bad Comment!")
        visit group_path(valid_group)
      end
      it "doesn't show other group comments" do
        expect(page).to_not have_content('Bad Comment!')
      end
    end

  end

end
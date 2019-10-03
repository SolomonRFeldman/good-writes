require 'rails_helper'

describe 'Group Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_group) { create(:valid_group) }
  let(:secondary_user) { create(:valid_user, :username => "Hello", :email => "Hello@Hush.com", :password => "hush") }
  let(:valid_piece) { create(:valid_piece, user_id: valid_user.id) }
  
  context "when a user is a moderator of a group and they click the next piece button" do
    before do
      login_user(valid_user)
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id, moderator_status: true)
      UserGroup.create(user_id: secondary_user.id, group_id: valid_group.id)
      visit group_path(valid_group)
      click_button('Next Piece')
    end

    it "goes to the next piece in the cycle" do
      expect(Group.find(valid_group.id).point_in_cycle).to eq(1)
    end
  end

  context "when a user is not a moderator of a group" do
    before do
      login_user(secondary_user)
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id, moderator_status: true)
      UserGroup.create(user_id: secondary_user.id, group_id: valid_group.id)
      visit group_path(valid_group)
    end

    context "when they go to click the next piece button" do
      it "cannot find the Next Piece button" do
        expect{ click_button('Next Piece') }.to raise_error(Capybara::ElementNotFound)
      end
    end

    context "when they make an update request" do
      before do
        page.driver.submit :patch, group_path(valid_group), group: { point_in_cycle: valid_group.point_in_cycle + 1 }
      end
      it "fails to change the point" do
        expect(Group.find(valid_group.id).point_in_cycle).to eq(0)
      end
    end
  end

end
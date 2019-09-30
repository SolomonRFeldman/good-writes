require 'rails_helper'

describe 'Group Features', :type => :feature do
  include_context "create_all"

  describe 'GET /' do
    before do
      valid_user
      page.set_rack_session(user_id: valid_user.id)
      valid_group
      visit '/'
    end

    it "displayes created group on root and groups index page" do
      expect(page).to have_content("Sunshine Friends")
      visit '/groups'
      expect(page).to have_content("Sunshine Friends")
    end

    context 'when a user clicks the join button next to a group and selects an alias' do
      before do
        click_button('Join')
        fill_in("user_group[alias]", with: "Victor")
        click_button('Join')
      end

      it 'joins them to the group with their selected alias' do
        expect(UserGroup.find_by(user_id: valid_user.id, group_id: valid_group.id, alias: 'Victor')).to_not be_nil
      end
    end

  end
 
  describe "when a user navigates to a group's show page they've joined" do
    before do
      valid_user
      page.set_rack_session(user_id: valid_user.id)
      valid_group
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id, alias: 'Victor')
      visit group_path(valid_group)
    end

    it "displays group's name" do
      expect(page).to have_content("Sunshine Friends")
    end

    it "displayes user by their alias" do
      expect(page).to have_content("Victor")
    end
  end

  context 'when a user changes their alias' do
    before do
      valid_user
      page.set_rack_session(user_id: valid_user.id)
      valid_group
      user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
      visit edit_group_user_group_path(valid_group, user_group)
      fill_in("user_group[alias]", with: "Victor")
      click_button('Change Alias')
    end

    it "changes their alias" do
      expect(UserGroup.last.alias).to eq("Victor")
    end
  end
  
  context "when a user tries to change someone else's alias" do
    before do
      valid_user
      page.set_rack_session(user_id: valid_user.id)
      valid_group
      user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
      secondary_user
      page.set_rack_session(user_id: secondary_user.id)
      visit edit_group_user_group_path(valid_group, user_group)
    end
    it 'redirects to root path' do
      expect(current_path).to eq('/')
    end
  end

  context "when a user leaves it's group" do
    before do
      valid_user
      page.set_rack_session(user_id: valid_user.id)
      valid_group
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
      visit group_path(valid_group)
      click_button('Leave Group')
    end

    it "removes the user from the group" do
      expect(valid_user.groups).to be_empty
    end
  end

end
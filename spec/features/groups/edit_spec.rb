require 'rails_helper'

describe 'Group Features', :type => :feature do
  include_context "create_all"

  it "can have a user change their alias" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    visit edit_group_user_group_path(valid_group, user_group)
    fill_in("user_group[alias]", with: "Victor")
    click_button('Change Alias')
    expect(page).to have_content("Victor")
  end

  it "allows only the creater of the user_group to change their alias" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    secondary_user
    page.set_rack_session(user_id: secondary_user.id)
    visit edit_group_user_group_path(valid_group, user_group)
    expect(current_path).to eq('/')
  end

  it "allows a user to join a group and redirect to group page" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    secondary_user
    page.set_rack_session(user_id: secondary_user.id)
    visit root_path
    click_button('Join')
    fill_in("user_group[alias]", with: "Victor")
    click_button('Join')
    expect(UserGroup.find_by(user_id: secondary_user, group_id: valid_group.id, alias: 'Victor')).to_not be_nil
  end

end
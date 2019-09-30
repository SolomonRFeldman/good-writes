require 'rails_helper'

describe 'Group Features', :type => :feature do
  include_context "create_all"

  it "displayes created group on root and groups index page" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    visit '/'
    expect(page).to have_content("Sunshine Friends")
    visit '/groups'
    expect(page).to have_content("Sunshine Friends")
  end

  it "display created group's show page" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    visit group_path(valid_group)
    expect(page).to have_content("Sunshine Friends")
  end

  it "displayes users in a group's show page" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    UserGroup.create(user_id: valid_user.id, group_id: valid_group.id, alias: 'Victor')
    visit group_path(valid_group)
    expect(page).to have_content("Victor")
  end

end
require 'rails_helper'

describe 'Group Features', :type => :feature do
  include_context "create_all"
  
  it "can be created by a user" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    visit '/groups/new'
    fill_in("group[name]", with: "Sunshine Friends")
    select("Poetry", from: "group[form]")
    click_button('Create Group')
    expect(Group.all.last.name).to eq("Sunshine Friends")
  end

  it "redirects to login if not logged in" do
    visit '/groups/new'
    expect(current_path).to eq("/")
  end

  it "does not create a group if not logged in" do
    page.driver.post "/groups", group: {name: "Sunshine Friends", form: "Poetry"}
    expect(Group.all.last && (Group.all.last.name == "Sunshine Friends")).to_not eq(true)
  end

  it "links a user to the group it creates" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    visit '/groups/new'
    fill_in("group[name]", with: "Sunshine Friends")
    select("Poetry", from: "group[form]")
    click_button('Create Group')
    expect(UserGroup.all.last.user.id).to eq(valid_user.id)
    expect(UserGroup.all.last.group.id).to eq(Group.all.last.id)
  end

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

  it "creates a group with the user's chosen alias displayed in group show" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    visit '/groups/new'
    fill_in("group[name]", with: "Sunshine Friends")
    select("Poetry", from: "group[form]")
    fill_in("user_group[alias]", with: "Victor")
    click_button('Create Group')
    expect(page).to have_content("Victor")
  end

  it "defaults the alias to the user's username when none is provided" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    visit '/groups/new'
    fill_in("group[name]", with: "Sunshine Friends")
    select("Poetry", from: "group[form]")
    click_button('Create Group')
    expect(page.body[/<\/header>[\S\s]+/]).to include("Test")
  end

  it "can have a user leave" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    visit group_path(valid_group)
    click_button('Leave Group')
    expect(valid_user.groups).to be_empty
  end

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
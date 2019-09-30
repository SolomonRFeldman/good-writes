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

end
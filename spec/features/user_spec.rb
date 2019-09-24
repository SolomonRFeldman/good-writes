require 'rails_helper'

describe 'User Features', :type => :feature do
  include_context "create_all"

  it "can sign up and redirects to root path" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up')
    expect(current_path).to eq("/")
  end

  it "adds a session hash on sign up" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up')
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "displays username after signing up" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up')
    expect(page).to have_content("Test")
  end

  it "redirects back to users/new if username is blank" do
    visit '/users/new'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up')
    expect(current_path).to eq('/users/new')
  end

  it "redirects if email is blank" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up')
    expect(current_path).to eq('/users/new')
  end

  it "redirects if password fields are blank" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    click_button('Sign Up')
    expect(current_path).to eq('/users/new')
  end
  
  it "redirects if password_confirmation is blank" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Sign Up')
    expect(current_path).to eq('/users/new')
  end

  it "redirects if password_confirmation does not match password" do
    visit '/users/new'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "321")
    click_button('Sign Up')
    expect(current_path).to eq('/users/new')
  end
  
  it "can show a users show page" do
    visit "/users/#{valid_user.id}"
    expect(page).to have_content("Test")
  end
  
end
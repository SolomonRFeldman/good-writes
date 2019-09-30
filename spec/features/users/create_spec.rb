require 'rails_helper'

describe 'User Features', :type => :feature do
  include_context "create_all"
  
  it "can sign up and redirects to root path" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq("/")
  end

  it "adds a session hash on sign up" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "redirects back to users/new if username is blank" do
    visit '/signup'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects if email is blank" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects if password fields are blank" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects if password_confirmation is blank" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects if password_confirmation does not match password" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "321")
    click_button('Sign Up', name: 'body_signup')
    expect(current_path).to eq('/signup')
  end

  it "can use the sign up button to get to the sign up path" do
    visit '/'
    click_button('Sign Up', name: 'layout_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects to root from signin path when logged in" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    visit '/signup'
    expect(current_path).to eq('/')
  end



end
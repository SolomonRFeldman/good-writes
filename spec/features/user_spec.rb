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

  it "displays username after signing up" do
    visit '/signup'
    fill_in("user[username]", with: "Test")
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    fill_in("user[password_confirmation]", with: "123")
    click_button('Sign Up', name: 'body_signup')
    expect(page).to have_content("Test")
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
  
  it "can show a users show page" do
    visit "/users/#{valid_user.id}"
    expect(page).to have_content("Test")
  end
  
  it "can log in and redirects to root path" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    expect(current_path).to eq("/")
  end

  it "adds a session hash on login" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    expect(page.get_rack_session_key('user_id')).to eq(valid_user.id)
  end

  it "displays username after logging in" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    expect(page).to have_content("Test")
  end

  it "redirected back to login with incorrect email" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@124.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    expect(current_path).to eq("/login")
  end

  it "redirects back to login with incorrect password" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "124")
    click_button('Log In', name: 'body_login')
    expect(current_path).to eq("/login")
  end

  it "can use the log out button to" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    expect(page.get_rack_session_key('user_id')).to eq(valid_user.id)
    visit '/'
    click_button('Log Out')
    expect{page.get_rack_session_key('user_id')}.to raise_error(KeyError)
  end

  it "can use the log in button to get to the log in path" do
    visit '/'
    click_button('Log In', name: 'layout_login')
    expect(current_path).to eq('/login')
  end

  it "can use the sign up button to get to the sign up path" do
    visit '/'
    click_button('Sign Up', name: 'layout_signup')
    expect(current_path).to eq('/signup')
  end

  it "redirects to root from login path when logged in" do
    valid_user
    visit '/login'
    fill_in("user[email]", with: "Test@123.com")
    fill_in("user[password]", with: "123")
    click_button('Log In', name: 'body_login')
    visit '/login'
    expect(current_path).to eq('/')
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
  
  it "displayes joined groups on the user's show page" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    visit user_path(valid_user)
    expect(page).to have_content("Sunshine Friends")
  end

end
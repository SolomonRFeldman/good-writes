require 'rails_helper'

describe 'User Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_group) { create(:valid_group) }

  context 'when a user signs up' do
    before do
      visit '/signup'
      fill_in("user[username]", with: "Test")
      fill_in("user[email]", with: "Test@123.com")
      fill_in("user[password]", with: "123")
      fill_in("user[password_confirmation]", with: "123")
      click_button('Sign Up', name: 'body_signup')
    end

    it "displays the username" do
      expect(page).to have_content("Test")
    end
  end
  
  context 'when a user navigates to their user show page' do
    before do
      login_user(valid_user)
      visit user_path(valid_user)
    end

    it 'shows the username' do
      expect(page.body[/<\/header>[\S\s]+/]).to include("Test")
    end

    context "when they've joined a group" do
      before do
        valid_group
        UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
        visit user_path(valid_user)
      end

      it "displays the group" do
        expect(page).to have_content("Sunshine Friends")
      end
    end
  end
  
  describe 'GET /login' do
    before do
      valid_user
      visit '/login'
    end

    context 'when a user logs in' do
      before do
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "123")
        click_button('Log In', name: 'body_login')
      end

      it " redirects to root path" do
        expect(current_path).to eq("/")
      end

      it "adds a session hash" do
        expect(page.get_rack_session_key('user_id')).to eq(valid_user.id)
      end

      it "displays username" do
        expect(page).to have_content("Test")
      end
    end

    context 'when email is invalid' do
      before do
        fill_in("user[email]", with: "Test@124.com")
        fill_in("user[password]", with: "123")
        click_button('Log In', name: 'body_login')
      end
    
      it 'redirects back to login' do
        expect(current_path).to eq("/login")
      end
    end

    context 'when the password is incorrect' do
      before do
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "124")
        click_button('Log In', name: 'body_login')
      end
      
      it 'redirects back to login' do
        expect(current_path).to eq("/login")
      end
    end
    
  end
  
  describe 'layout buttons' do
    context 'when the user presses the log out button'
      before do
        login_user(valid_user)
        visit '/'
        click_button('Log Out')
      end

      it 'deletes the session hash' do
        expect{page.get_rack_session_key('user_id')}.to raise_error(KeyError)
      end
    
    context 'when the user preses the log in button' do
      before do
        visit '/'
        click_button('Log In', name: 'layout_login')
      end

      it 'directs them to the login page' do
        expect(current_path).to eq('/login')
      end

    end

  end
  
  context 'when a user goes to the login path while logged in' do
    before do
      login_user(valid_user)
      visit '/login'
    end

    it 'redirects them to the root path' do
      expect(current_path).to eq('/')
    end
  end

 

end
require 'rails_helper'

describe 'User Features', :type => :feature do
  
  describe 'GET /signup' do
    before { visit '/signup' }

    context "when a user signs up" do
      before do
        fill_in("user[username]", with: "Test")
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "123")
        fill_in("user[password_confirmation]", with: "123")
        click_button('Sign Up', name: 'body_signup')
      end
      
      it "creates a user" do
        expect(User.all.last.username).to eq('Test')
      end

      it "redirects to the root path" do
        expect(current_path).to eq("/")
      end

      it "adds a session hash" do
        expect(page.get_rack_session_key('user_id')).to_not be_nil
      end
    end

    context "when username is blank" do
      before do
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "123")
        fill_in("user[password_confirmation]", with: "123")
        click_button('Sign Up', name: 'body_signup')
      end
      
      it 'redirects back to signup' do
        expect(current_path).to eq('/signup')
      end
    end

    context "when email is blank" do
      before do
        fill_in("user[username]", with: "Test")
        fill_in("user[password]", with: "123")
        fill_in("user[password_confirmation]", with: "123")
        click_button('Sign Up', name: 'body_signup')
      end
      
      it 'redirects back to signup' do
        expect(current_path).to eq('/signup')
      end
    end


    context "when password fields are blank" do
      before do
        fill_in("user[username]", with: "Test")
        fill_in("user[email]", with: "Test@123.com")
        click_button('Sign Up', name: 'body_signup')
      end

      it 'redirects back to signup' do
        expect(current_path).to eq('/signup')
      end
    end

    context "when password_confirmation is blank" do
      before do
        fill_in("user[username]", with: "Test")
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "123")
        click_button('Sign Up', name: 'body_signup')
      end

      it 'redirects back to signup' do
        expect(current_path).to eq('/signup')
      end
    end

    context "when password_confirmation does not match password" do
      before do
        fill_in("user[username]", with: "Test")
        fill_in("user[email]", with: "Test@123.com")
        fill_in("user[password]", with: "123")
        fill_in("user[password_confirmation]", with: "321")
        click_button('Sign Up', name: 'body_signup')
      end
      
      it 'redirects back to signup' do
        expect(current_path).to eq('/signup')
      end
    end
  end

  context "when a user goes to the signup path while logged in" do
    let(:valid_user) { create(:valid_user) }
    before do
      page.set_rack_session(user_id: valid_user.id)
      visit '/signup'
    end

    it 'redirects to root path' do
      expect(current_path).to eq('/')
    end

  end

  context 'when a user is on any page and clicks the sign up button' do
    before do
      visit '/'
      click_button('Sign Up', class: 'layout_signup')
    end

    it "redirects to the sign up path" do
      expect(current_path).to eq('/signup')
    end

  end

end
require 'rails_helper'

describe 'Group Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_group) { create(:valid_group) }
  let(:secondary_user) { create(:valid_user, :username => "Hello", :email => "Hello@Hush.com", :password => "hush") }
  let(:valid_piece) { create(:valid_piece, user_id: valid_user.id) }

  describe 'GET /' do
    before do
      login_user(valid_user)
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

      it "redirects them to the group page" do
        expect(page.current_path).to eq(group_path(valid_group))
      end
    end

    context 'when a user clicks the view button when they are part of a group' do
      before do
        UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
        visit root_path
        click_button('View')
      end

      it "brings the user to the group show" do
        expect(page.current_path).to eq(group_path(valid_group))
      end
    end

    context 'when a user is already part of a group' do
      before do
        UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
        visit root_path
      end

      it 'does not show the join group button' do
        expect{ click_button('Join') }.to raise_error(Capybara::ElementNotFound)
      end
    end

    context 'when a user is already part of a group and they go to the join group form' do
      before do
        UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
        click_button('Join')
      end

      it "redirects to the group" do
        expect(page.current_path).to eq(group_path(valid_group))
      end
    end

  end

  context "when a user is not logged in on the root path" do
    before do
      valid_group
      visit root_path
    end

    it "does not show the join button" do
      expect{ click_button 'Join' }.to raise_error(Capybara::ElementNotFound)
    end
  end
 
  context "when a user navigates to a group's show page they've joined" do
    before do
      login_user(valid_user)
      valid_group
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id, alias: 'Victor', piece_id: valid_piece.id)
      visit group_path(valid_group)
    end

    it "displays group's name" do
      expect(page).to have_content("Sunshine Friends")
    end

    it "displayes user by their alias" do
      expect(page).to have_content("Victor")
    end

    it "displayes the title and content of the featured piece" do
      expect(page).to have_content(valid_piece.title)
      expect(page).to have_content(valid_piece.content)
    end
  end

  context 'when a user changes their alias' do
    before do
      login_user(valid_user)
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
      login_user(valid_user)
      valid_group
      user_group = UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
      login_user(secondary_user)
      visit edit_group_user_group_path(valid_group, user_group)
    end
    it 'redirects to root path' do
      expect(current_path).to eq('/')
    end
  end

  context "when a user leaves it's group" do
    before do
      login_user(valid_user)
      valid_group
      UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
      visit group_path(valid_group)
      click_button('Leave Group')
    end

    it "removes the user from the group" do
      expect(valid_user.groups).to be_empty
    end
  end

  context "when a user selects the piece they want to prepare" do
    let(:user_group) { UserGroup.create(user_id: valid_user.id, group_id: valid_group.id) }
    before do
      login_user(valid_user)
      valid_group
      user_group
      valid_piece
      visit group_path(valid_group)
      select(valid_piece.title, from: "user_group[piece_id]")
      click_button("Select Piece")
    end

    it "prepares their piece" do
      expect(UserGroup.last.piece).to eq(valid_piece)
    end

    it "locks in their piece when it's their turn in the cycle" do
      expect{ click_button('Select Piece') }.to raise_error(Capybara::ElementNotFound)
    end
  end

  context "when a user tries to select a piece that does not match the group's form" do
    let(:non_fiction_piece) { create(:valid_piece, title: 'True Stuff', form: 'Non-Fiction') }
    let(:user_group) { UserGroup.create(user_id: valid_user.id, group_id: valid_group.id) }
    before do
      login_user(valid_user)
      valid_group
      user_group
      valid_piece
      non_fiction_piece
      visit group_path(valid_group)
    end

    it "doesn't show up on the list" do
      expect{ select(non_fiction_piece.title, from: "user_group[piece_id]") }.to raise_error(Capybara::ElementNotFound)
    end
  end

  context "when a user navigates to a group's show page they've not joined" do
    before do
      login_user(valid_user)
      valid_group
      visit group_path(valid_group)
    end

    it 'redirects to the root page' do
      expect(page.current_path).to eq(root_path)
    end
  end

  context "when a user navigates to a group page that doesn't exists" do
    before do
      login_user(valid_user)
      visit group_path('aksljdakl')
    end

    it "redirects to the root page" do
      expect(page.current_path).to eq(root_path)
    end
  end

end
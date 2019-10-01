require 'rails_helper'

describe 'Group Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  
  describe 'GET /groups/new' do
    before do
      login_user(valid_user)
      visit('/groups/new')
    end

    context 'when a users creates a group' do
      before do
        fill_in("group[name]", with: "Sunshine Friends")
        select("Poetry", from: "group[form]")
        click_button('Create Group')
      end

      it "gets created" do
        expect(Group.all.last.name).to eq("Sunshine Friends")
      end

      it "links a user to the group it creates" do
        expect(UserGroup.all.last.user.id).to eq(valid_user.id)
        expect(UserGroup.all.last.group.id).to eq(Group.all.last.id)
      end

      context 'when no alias is provided' do
        it "defaults the alias to the user's username" do
          expect(UserGroup.all.last.alias).to eq('Test')
        end
      end
    end
    
    context 'when a user creates a group with an alias' do
      before do
        fill_in("group[name]", with: "Sunshine Friends")
        select("Poetry", from: "group[form]")
        fill_in("user_group[alias]", with: "Victor")
        click_button('Create Group')
      end

      it "creates a join with the user's chosen alias" do
        expect(UserGroup.all.last.alias).to eq('Victor')
      end
    end

  end
  
  
  context 'when a user is not logged in' do

    describe 'GET /groups/new' do
      before { visit '/groups/new' }
      it "redirects to login if not logged in" do
        expect(current_path).to eq("/")
      end
    end

    describe 'POST /groups/' do
      before { page.driver.post "/groups", group: {name: "Sunshine Friends", form: "Poetry"} }
      it "does not create a group" do
        expect(Group.all.last && (Group.all.last.name == "Sunshine Friends")).to_not eq(true)
      end
    end

  end
  
end
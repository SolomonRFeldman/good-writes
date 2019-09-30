require 'rails_helper'

describe 'Piece Features', :type => :feature do
  include_context "create_all"

  describe 'new_user_piece path' do

    context "when a user creates a piece" do
      before do
        valid_user
        page.set_rack_session(user_id: valid_user.id)
        visit user_path(valid_user)
        click_button('Add Piece')
        fill_in("piece[title]", with: "My Little Poem")
        fill_in("piece[content]", with: "Yeah")
        select("Poetry", from: "piece[form]")
        click_button('Add Piece')
      end
      
      it "creates a piece" do
        expect(Piece.all.last.title).to eq("My Little Poem")
        expect(Piece.all.last.content).to eq("Yeah")
      end

      it "redirects to the users show page" do
        expect(page.current_path).to eq(user_path(valid_user))
      end

    end

  end

end
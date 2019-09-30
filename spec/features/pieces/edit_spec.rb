require 'rails_helper'

describe 'Piece Features', :type => :feature do
  include_context "create_all"

  before do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_piece.update(user_id: valid_user.id)
  end
  
  describe "user's show page" do
    context "when a user clicks the edit button next to their piece" do
      before do
        visit user_path(valid_user)
        click_button('Edit')
      end

      it "redirects them to the edit_user_piece path" do
        expect(page.current_path).to eq(edit_user_piece_path(valid_user, valid_piece))
      end
    end

  end

  describe 'edit_user_piece path' do
    before do
      visit(edit_user_piece_path(valid_user, valid_piece))
    end

    context 'when a user edits a piece' do
      before do
        fill_in("piece[title]", with: "My Big Poem")
        fill_in("piece[content]", with: "Nope")
        click_button('Update')
      end

      it 'edits the piece' do
        expect(Piece.all.last.title).to eq("My Big Poem")
        expect(Piece.all.last.content).to eq("Nope")
      end

      it "redirects to the users show page" do
        expect(page.current_path).to eq(user_path(valid_user))
      end
    end

  end
  
end
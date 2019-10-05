require 'rails_helper'

describe 'Piece Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_piece) { create(:valid_piece) }

  before do
    login_user(valid_user)
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

    context 'when a user edits a piece' do
      before do
        visit(edit_user_piece_path(valid_user, valid_piece))
        fill_in("piece[title]", with: "My Big Poem")
        fill_in("piece[content]", with: "Nope")
        click_button('Update')
      end

      it 'edits the piece' do
        expect(Piece.all.last.title).to eq("My Big Poem")
        expect(Piece.all.last.content).to eq("Nope")
      end

      it "redirects to the piece show page" do
        expect(page.current_path).to eq(user_piece_path(valid_user, Piece.all.last))
      end
    end

    context 'when a different user tries to edit anothers piece' do
      let(:user_2) { create(:valid_user, username: 'Hello', email: 'Hello@hush.com') }
      before do
        login_user(user_2)
      end

      describe 'through a get request to the form' do
        before do
          visit(edit_user_piece_path(valid_user, valid_piece))
        end
        it 'redirects to the root path' do
          expect(page.current_path).to eq(root_path)
        end
      end

      describe 'through a update request' do
        before do
          page.driver.submit :patch, user_piece_path(valid_user, valid_piece), piece: {title: "My Big Poem", content: "Nope"}
        end

        it 'does not edit the piece' do
          expect(Piece.all.last.title).to eq("Sunshine Land")
          expect(Piece.all.last.content).to eq("There once was a sunny land.")
        end
      end
    end

  end
  
end
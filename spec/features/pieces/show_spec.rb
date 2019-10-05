require 'rails_helper'

describe 'Piece Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_piece) { create(:valid_piece) }

  before do
    login_user(valid_user)
    valid_piece.update(user_id: valid_user.id)
  end

  context 'when a user is on their show page' do
    before do
      visit(user_path(valid_user))
    end

    it "shows their piece" do
      expect(page).to have_content("Sunshine Land")
    end
  end

  context "when a user navigates to the piece's show" do
    let(:user_piece) { create(:valid_piece, user_id: valid_user.id) }
    before do
      valid_user
      user_piece
      visit user_piece_path(valid_user, user_piece)
    end

    it "shows the title" do
      expect(page).to have_content('Sunshine Land')
    end

    it "shows the content" do
      expect(page).to have_content("There once was a sunny land.")
    end

    it "shows the form" do
      expect(page).to have_content('Poetry')
    end
  end

  context "when a user clicks the edit button on their piece's show" do
    let(:user_piece) { create(:valid_piece, user_id: valid_user.id) }
    before do
      valid_user
      user_piece
      visit user_piece_path(valid_user, user_piece)
      click_button 'Edit'
    end

    it "navigates to the piece's edit page" do
      expect(page.current_path).to eq(edit_user_piece_path(valid_user, user_piece))
    end
  end

  context "when a user clicks the delete button on their piece's show" do
    let(:user_piece) { create(:valid_piece, user_id: valid_user.id) }
    before do
      valid_user
      user_piece
      visit user_piece_path(valid_user, user_piece)
      click_button 'Delete'
    end

    it "deletes the piece" do
      expect(Piece.find_by(id: user_piece.id)).to be_nil
    end
  end

end
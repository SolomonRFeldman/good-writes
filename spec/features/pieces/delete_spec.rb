require 'rails_helper'

describe 'Piece Features', :type => :feature do
  let(:valid_user) { create(:valid_user) }
  let(:valid_piece) { create(:valid_piece) }
  
  before do
    login_user(valid_user)
    valid_piece.update(user_id: valid_user.id)
  end

  describe 'a users show page' do
    context 'when a user clicks the delete button next to their piece' do
      before do
        visit user_path(valid_user)
        click_button('Delete')
      end

      it 'deletes their piece' do
        expect(Piece.find_by(id: valid_piece.id)).to be_nil
      end

      it 'redirects back to the user path' do 
        expect(page.current_path).to eq(user_path(valid_user))
      end
    end

  end

  context 'when a different user sends a delete request to anothers piece' do
    let(:user_2) { create(:valid_user, username: 'Hello', email: 'Hello@hush.com') }
    before do
      login_user(user_2)
      page.driver.submit :delete, user_piece_path(valid_user, valid_piece), {}
    end

    it 'does not destroy the piece' do
      expect(Piece.find_by(id: valid_piece.id)).to_not be_nil
    end
  end


end
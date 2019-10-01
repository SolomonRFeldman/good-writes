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

end
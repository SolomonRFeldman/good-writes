require 'rails_helper'

describe 'Piece Features', :type => :feature do
  include_context "create_all"

  before do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
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
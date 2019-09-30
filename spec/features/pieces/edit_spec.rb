require 'rails_helper'

describe 'Piece Features', :type => :feature do
  include_context "create_all"
  
  it "can be edited" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_piece.update(user_id: valid_user.id)
    visit user_path(valid_user)
    click_button('Edit')
    fill_in("piece[title]", with: "My Big Poem")
    click_button('Update')
    expect(page).to have_content("My Big Poem")
    expect(Piece.all.last.title).to eq("My Big Poem")
  end
  
end
require 'rails_helper'

describe 'Piece Features', :type => :feature do
  include_context "create_all"
  
  it "can be created by a user" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    visit user_path(valid_user)
    click_button('Add Piece')
    fill_in("piece[title]", with: "My Little Poem")
    fill_in("piece[content]", with: "Yeah")
    select("Poetry", from: "piece[form]")
    click_button('Add Piece')
    expect(page).to have_content("My Little Poem")
    expect(Piece.all.last.title).to eq("My Little Poem")
  end

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
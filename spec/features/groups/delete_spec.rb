require 'rails_helper'

describe 'Group Features', :type => :feature do
  include_context "create_all"
  
  it "can have a user leave" do
    valid_user
    page.set_rack_session(user_id: valid_user.id)
    valid_group
    UserGroup.create(user_id: valid_user.id, group_id: valid_group.id)
    visit group_path(valid_group)
    click_button('Leave Group')
    expect(valid_user.groups).to be_empty
  end

end
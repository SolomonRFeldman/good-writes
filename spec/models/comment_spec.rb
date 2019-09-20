require 'rails_helper'

RSpec.describe Comment, :type => :model do
  include_context "create_all"

  let(:valid_params) {
    {
      piece_id: valid_piece.id,
      user_id: valid_user.id,
      group_id: valid_group.id,
      content: "Dope"
    }
  }

  it "is valid with a user, piece, group, and content" do
    expect(valid_comment).to be_valid
  end

  it "belongs to a user, a piece, and a group" do
    expect(valid_comment.piece).to eq(valid_piece)
    expect(valid_comment.user).to eq(valid_user)
    expect(valid_comment.group).to eq(valid_group)
  end
  
  it "is not valid without content" do
    expect(Comment.new(valid_params.merge(content: ""))).to_not be_valid
  end

end
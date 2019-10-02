require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:valid_comment) { create(:valid_comment) }
  let(:valid_user) { valid_comment.user }
  let(:valid_group) { valid_comment.group }
  let(:valid_piece) { valid_comment.piece }

  it "is valid with a user, piece, group, and content" do
    expect(valid_comment).to be_valid
  end

  it "belongs to a user, a piece, and a group" do
    expect(valid_comment.piece).to eq(valid_piece)
    expect(valid_comment.user).to eq(valid_user)
    expect(valid_comment.group).to eq(valid_group)
  end
  
  it "is not valid without content" do
    expect(build(:valid_comment, content: "")).to_not be_valid
  end

end
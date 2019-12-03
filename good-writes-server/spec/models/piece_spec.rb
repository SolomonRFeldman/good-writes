require 'rails_helper'

RSpec.describe Piece, :type => :model do
  let(:valid_piece) { create(:valid_piece) }
  let(:valid_user) { create(:valid_user) }

  it "is valid with a title, content, and a form" do
    expect(valid_piece).to be_valid
  end
  
  it "is not valid with a blank title" do
    expect(build(:valid_piece, title: "")).to_not be_valid
  end

  it "is not valid with blank content" do
    expect(build(:valid_piece, content: "")).to_not be_valid
  end

  it "is not valid with blank form" do
    expect(build(:valid_piece, form: "")).to_not be_valid
  end

  context "when it has a user assigned to it" do
    before do
      valid_piece.user = valid_user
    end
    it "has a user associated" do
      expect(valid_piece.user).to eq(valid_user)
    end
  end
  
  context "when it has many comments assigned to it" do
    let(:comment1) { create(:valid_comment, piece_id: valid_piece.id, user_id:  valid_user.id) }
    let(:comment2) { create(:valid_comment, piece_id: valid_piece.id, user_id: valid_user.id) }
    before do
      comment1
      comment2
    end
    it "has many comments associated" do
      expect(valid_piece.comments).to eq([comment1, comment2])
    end
  end

end
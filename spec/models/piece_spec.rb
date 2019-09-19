require 'rails_helper'

RSpec.describe Piece, :type => :model do
  include_context "create_all"

  let(:valid_params) {
    {
      title: "My Little Poem",
      content: "Yeah",
      form: "Poetry"
    }
  }

  it "is valid with a title, content, and a form" do
    expect(valid_piece).to be_valid
  end
  
  it "is not valid with a blank title" do
    expect(Piece.new(valid_params.merge(title: ""))).to_not be_valid
  end

  it "is not valid with blank content" do
    expect(Piece.new(valid_params.merge(content: ""))).to_not be_valid
  end

  it "is not valid with blank form" do
    expect(Piece.new(valid_params.merge(form: ""))).to_not be_valid
  end

  it "can have a user" do
    valid_piece.user = valid_user
    expect(valid_piece.user).to eq(valid_user)
  end

end
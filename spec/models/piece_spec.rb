require 'rails_helper'

RSpec.describe Piece, :type => :model do

  let(:valid_piece) {
    Piece.create(
      title: "Sunshine Land",
      content: "There once was a sunny land.",
      form: "Fiction"
    )
  }

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

end
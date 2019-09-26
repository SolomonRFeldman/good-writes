RSpec.shared_context "create_all" do

  let(:valid_user) { 
    User.create(
      :username => "Test",
      :email => "Test@123.com",
      :password => "123"
    )
  }

  let(:valid_piece) {
    Piece.create(
      title: "Sunshine Land",
      content: "There once was a sunny land.",
      form: "Fiction"
    )
  }

  let(:valid_group) {
    Group.create(
      name: "Sunshine Friends",
      form: "Poetry"
    )
  }

  let(:valid_comment) {
    Comment.create(
      piece_id: valid_piece.id,
      user_id: valid_user.id,
      group_id: valid_group.id,
      content: "Pretty good"
    )
  }

end
class UserSerializer
  
  def initialize(user)
    @user = user
  end

  def to_serialized_json
    options = {
      only: [
        :id,
        :username
      ],
      include: {
        pieces: {},
        groups: {}
      }
    }
    @user.to_json(options)
  end

end
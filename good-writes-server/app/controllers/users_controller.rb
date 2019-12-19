class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.save ? render(json: user.login_hash) : render(json: { errors: user.errors })
  end

  def show
    @user = User.find(params[:id]) if JwtService.decode(request.headers[:Token])[:user_id] == params[:id].to_i
    render json: UserSerializer.new(@user).to_serialized_json
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
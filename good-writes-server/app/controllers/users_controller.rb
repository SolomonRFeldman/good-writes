class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    render json: @user.attributes.slice('id', 'username').merge(token: JwtService.encode({user_id: @user.id})) if @user.save
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
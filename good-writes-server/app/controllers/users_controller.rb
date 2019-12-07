class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    render json: @user.attributes.slice('id', 'username').merge(token: JwtService.encode({user_id: @user.id})) if @user.save
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
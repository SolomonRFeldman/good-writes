class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
class UsersController < ApplicationController

  def new
    redirect_to root_path if @current_user
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.messages
      return render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless @user && @user.id == session[:user_id]
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
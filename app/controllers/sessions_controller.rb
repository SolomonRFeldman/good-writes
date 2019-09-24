class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    return redirect_to '/login' unless @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

end
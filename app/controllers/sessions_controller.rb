class SessionsController < ApplicationController

  def new
    redirect_to root_path if @current_user
    @user = User.new
  end

  def create
    if auth = request.env['omniauth.auth']
      @user = User.find_or_create_by(auth_id: auth.uid) do |u|
        u.auth_id = auth.uid
        u.username = auth.info.name
      end
    else 
      @user = User.find_by(email: params[:user][:email])
      return redirect_to '/login' unless @user && @user.authenticate(params[:user][:password])
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def delete
    session.destroy
    redirect_to root_path
  end

end
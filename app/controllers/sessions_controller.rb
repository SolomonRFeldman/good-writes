class SessionsController < ApplicationController

  def new
    redirect_to root_path if @current_user
    @user = User.new
  end

  def create
    if auth = request.env['omniauth.auth']
      @user = User.oauth_login(auth)
    else 
      @user = User.find_by(email: params[:user][:email])
      unless @user && @user.authenticate(params[:user][:password])
        @error = true
        return render 'new'
      end
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def delete
    session.destroy
    redirect_to root_path
  end

end
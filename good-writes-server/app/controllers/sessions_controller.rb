class SessionsController < ApplicationController

  def create
    if params[:token]
      token = params[:token] if @user = User.find_by(id: JwtService.decode(params[:token])[:user_id])
    else
      @user = User.find_by(email: params[:user][:email])
      unless @user && @user.authenticate(params[:user][:password])
        return render json: { error: true }
      end
    end
    render json: @user.login_hash(token)
  end

end
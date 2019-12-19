class SessionsController < ApplicationController

  def create
    if params[:token]
      token = params[:token] if @user = User.find_by(id: JwtService.decode(params[:token])[:user_id])
    else
      @user = User.find_by(email: params[:user][:email])
      unless @user && @user.authenticate(params[:user][:password])
        return render json: { error: true }
      end
      token = JwtService.encode({user_id: @user.id})
    end
    render json: @user.attributes.slice('id', 'username').merge(token: token)
  end

end
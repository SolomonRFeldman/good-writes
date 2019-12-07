class SessionsController < ApplicationController

  def create
    if params[:token]
      token = params[:token] if @user = User.find_by(id: JwtService.decode(params[:token])[:user_id])
    else
      @user = User.find_by(email: params[:user][:email])
      unless @user && @user.authenticate(params[:user][:password])
        @error = true
        return render json: 'no'.to_json
      end
      token = JwtService.encode({user_id: @user.id})
    end
    render json: { currentUser: @user.attributes.slice('id', 'username'), token: token }
  end

  # def delete
  #   session.destroy
  #   redirect_to root_path
  # end

end
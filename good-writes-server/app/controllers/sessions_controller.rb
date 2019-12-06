class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])
    unless @user && @user.authenticate(params[:user][:password])
      @error = true
      return render json: 'no'.to_json
    end
    render json: { token: JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base, 'HS256') }
  end

  # def delete
  #   session.destroy
  #   redirect_to root_path
  # end

end
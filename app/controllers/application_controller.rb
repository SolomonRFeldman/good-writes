class ApplicationController < ActionController::Base
  before_action :fetch_current_user

  def index
    @groups = Group.all
  end
  
  private

  def fetch_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authorized?(object)
    object && object.user_id == session[:user_id]
  end

end

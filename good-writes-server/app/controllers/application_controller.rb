class ApplicationController < ActionController::API
  before_action :fetch_current_user

  private

  def authorized?(object)
    object && object.user_id == JwtService.decode(request.headers[:Token])[:user_id]
  end

  def fetch_current_user
    @current_user_id = JwtService.decode(request.headers[:Token])[:user_id]
  end

  def status_code(code)
    render json: { status: code }, status: code
  end

end

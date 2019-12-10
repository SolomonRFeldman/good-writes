class ApplicationController < ActionController::API

  def authorized?(object)
    object && object.user_id == JwtService.decode(request.headers[:Token])[:user_id]
  end

end

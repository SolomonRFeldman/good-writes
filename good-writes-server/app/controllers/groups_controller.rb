class GroupsController < ApplicationController

  def index
    joined_groups = UserGroup.where(user_id: JwtService.decode(request.headers[:Token])[:user_id]) if request.headers[:Token]
    render json: { groups: Group.all.map{ |group| group.attributes }, user_groups: joined_groups }
  end

end
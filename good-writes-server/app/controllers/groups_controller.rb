class GroupsController < ApplicationController

  def index
    joined_groups = UserGroup.where(user_id: JwtService.decode(request.headers[:Token])[:user_id]) if request.headers[:Token]
    render json: { groups: Group.all, user_groups: joined_groups }
  end

  def show
    group = Group.find_by(id: params[:id])
    user_group = UserGroup.find_by(user_id: @current_user_id, group_id: group.id)
    if user_group
      render json: { group: group.show_attributes , user_group: user_group }
    else
      redirect_to root_path
    end
  end

end
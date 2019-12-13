class GroupsController < ApplicationController

  def index
    joined_groups = UserGroup.where(user_id: JwtService.decode(request.headers[:Token])[:user_id]) if request.headers[:Token]
    render json: { groups: Group.all.order(created_at: :desc), user_groups: joined_groups }
  end

  def show
    group = Group.find_by(id: params[:id])
    user_group = UserGroup.find_by(user_id: @current_user_id, group_id: group.id)
    if user_group
      render json: { group: group.show_attributes, user_group: user_group.show_attributes }
    else
      redirect_to root_path
    end
  end

  def create
    if @current_user_id
      group = Group.new_with_join(params[:group].merge({user_id: @current_user_id}))
      if group.save
        render json: group.to_json
      end
    end
  end

end
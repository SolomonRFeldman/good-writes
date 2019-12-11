class UserGroupsController < ApplicationController

  def create
    user_group = UserGroup.create(user_id: @current_user_id, group_id: params[:group_id], alias: params[:user_group][:alias])
    render json: user_group.to_json
  end

  private

  def user_group_params
    params.require(:user_group).permit(:alias, :piece_id)
  end

end
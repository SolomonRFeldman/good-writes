class UserGroupsController < ApplicationController

  def create
    user_group = UserGroup.create(user_id: @current_user_id, group_id: params[:group_id], alias: params[:user_group][:alias])
    render json: user_group.to_json
  end

  def update
    user_group = UserGroup.find_by(id: params[:id])
    if authorized?(user_group) && user_group.update(piece_id: params[:user_group][:piece_id])
      render json: user_group.to_json(include: [:piece])
    end
  end

  def destroy
    user_group = UserGroup.find_by(id: params[:id])
    if authorized?(user_group) && user_group.destroy
      render json: user_group.to_json
    end
  end

  private

  def user_group_params
    params.require(:user_group).permit(:alias, :piece_id)
  end

end
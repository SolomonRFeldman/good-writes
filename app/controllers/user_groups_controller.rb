class UserGroupsController < ApplicationController

  def edit
    @user_group = UserGroup.find_by(id: params[:id]) if @current_user
  end

  def update
    @user_group = UserGroup.find_by(id: params[:id])
    @user_group.update(user_group_params)
    redirect_to group_path(@user_group.group_id)
  end

  def destroy
    UserGroup.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_group_params
    params.require(:user_group).permit(:alias)
  end

end
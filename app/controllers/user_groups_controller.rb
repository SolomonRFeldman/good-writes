class UserGroupsController < ApplicationController

  def edit
    @user_group = UserGroup.find_by(id: params[:id])
    redirect_to root_path unless @user_group.user_id == @current_user.id
  end

  def update
    @user_group = UserGroup.find_by(id: params[:id])
    if @current_user.id == @user_group.user_id
      @user_group.update(user_group_params)
      redirect_to group_path(@user_group.group_id)
    else
      redirect_to root_path
    end
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
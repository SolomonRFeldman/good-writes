class UserGroupsController < ApplicationController

  def new
    @user_group = UserGroup.new
    @group = Group.find_by(id: params[:group_id])
    redirect_to root_path unless @group
    redirect_to group_path(@group) if UserGroup.find_by(user_id: @current_user.id, group_id: @group.id)
  end

  def create
    @user_group = UserGroup.create(user_id: @current_user.id, group_id: params[:group_id], alias: params[:user_group][:alias])
    redirect_to group_path(@user_group.group_id)
  end
  
  def edit
    @user_group = UserGroup.find_by(id: params[:id])
    @group = @user_group.group
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
    params.require(:user_group).permit(:alias, :piece_id)
  end

end
class GroupsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @group = Group.new
  end

  def create
    if @current_user
      @group = Group.create(group_params)
      UserGroup.create(user_id: @current_user.id, group_id: @group.id, alias: user_group_params[:alias])
      redirect_to group_path(@group)
    end
  end
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
    @user_group = UserGroup.find_by(user_id: @current_user, group_id: @group.id)
  end

  private
 
  def group_params
    params.require(:group).permit(:name, :form)
  end

  def user_group_params
    params[:user_group].permit(:alias)
  end

end
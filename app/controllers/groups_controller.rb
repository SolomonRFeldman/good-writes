class GroupsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @group = Group.new
  end

  def create
    if @current_user
      @group = Group.create(group_params)
      UserGroup.create(user_id: @current_user.id, group_id: @group.id, alias: user_group_params[:alias], moderator_status: true)
      redirect_to group_path(@group)
    end
  end

  def update
    @group = Group.find_by(id: params[:id])
    if @current_user && @group && UserGroup.find_by(user_id: @current_user.id, group_id: @group.id, moderator_status: true)
      @group.update(group_params)
      redirect_to group_path(@group)
    end
  end
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
    @user_groups = @group.user_groups if @group
    if @current_user && @group && @user_group = current_users_join
      @featured_piece = @group.featured_piece
    else
      redirect_to root_path
    end
  end

  private
 
  def group_params
    params.require(:group).permit(:name, :form, :point_in_cycle)
  end

  def user_group_params
    params[:user_group].permit(:alias)
  end

  def current_users_join
    @user_groups.select { |user_group| user_group.user_id == @current_user.id }.first
  end

end
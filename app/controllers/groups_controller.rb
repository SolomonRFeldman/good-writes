class GroupsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @group = Group.new
  end

  def create
    if @current_user
      @group = Group.create(group_params)
      UserGroup.create(user_id: @current_user.id, group_id: @group.id)
      redirect_to group_path(@group)
    end
  end

  def show
  end

  private
 
  def group_params
    params.require(:group).permit(:name, :form)
  end

end
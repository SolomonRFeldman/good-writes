class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to group_path(@group)
  end

  def show
  end

  private
 
  def group_params
    params.require(:group).permit(:name, :form)
  end

end
class GroupsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @group = Group.new
  end

  def create
    if @current_user
      @group = Group.create(group_params)
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
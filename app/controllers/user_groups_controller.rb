class UserGroupsController < ApplicationController

  def destroy
    UserGroup.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

end
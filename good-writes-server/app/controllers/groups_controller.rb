class GroupsController < ApplicationController

  def index
    render json: { groups: Group.all.map{ |group| group.attributes } }
  end

end
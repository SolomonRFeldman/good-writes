class GroupsController < ApplicationController

  def index
    joined_groups = UserGroup.where(user_id: JwtService.decode(request.headers[:Token])[:user_id]) if request.headers[:Token]
    render json: { groups: Group.all.order(created_at: :desc), user_groups: joined_groups }
  end

  def show
    return status_code(404) unless group = Group.find_by(id: params[:id])
    user_group = UserGroup.find_by(user_id: @current_user_id, group_id: group.id)
    user_group ? 
      render(json: { group: hide_comment_ids(group.show_attributes), user_group: user_group.show_attributes }) :
      status_code(403)
  end

  def create
    if @current_user_id
      group = Group.new_with_join(params[:group].merge({user_id: @current_user_id}))
      group.save ? render(json: group.to_json) : render(json: { errors: group.errors })
    end
  end

  def update
    group = Group.find_by(id: params[:id])
    if group && UserGroup.find_by(user_id: @current_user_id, group_id: group.id, moderator_status: true)
      group.update(point_in_cycle: params[:group][:point_in_cycle])
      render json: { group: hide_comment_ids(group.show_attributes) }
    end
  end

  private

  def hide_comment_ids(group)
    if group[:featured_piece]
      filtered_comments = group[:featured_piece][:comments].map do |comment| 
        comment.user_id = nil if comment.user_id != @current_user_id
        comment
      end
      group[:featured_piece][:comments] = filtered_comments
    end
    group
  end

end
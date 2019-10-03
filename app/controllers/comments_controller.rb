class CommentsController < ApplicationController

  def create
    @group = Group.find_by(id: params[:group_id])
    @user_group = UserGroup.find_by(user_id: @current_user.id, group_id: @group.id)
    if @user_group && @group.featured_piece.user_id != @current_user.id
      Comment.create(user_id: @current_user.id, group_id: @group.id, piece_id: @group.featured_piece.id, author_alias: @user_group.alias, content: params[:comment][:content])
    end
    redirect_to group_path(@group)
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_path unless @comment && @comment.user_id == @current_user.id
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(content: params[:comment][:content]) if @comment && @comment.user_id == @current_user.id
    redirect_to group_path(@comment.group)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy if @comment && @comment.user_id == @current_user.id
    redirect_to group_path(@comment.group)
  end

end
class CommentsController < ApplicationController

  def create
    @user_group = UserGroup.find_by(id: params[:user_group][:id])
    if authorized?(@user_group)
      comment = Comment.new(create_comment_params)
      comment.save ? render(json: comment.to_json) : render(json: { errors: comment.errors })
    end
  end

  def update
    comment = Comment.find_by(id: params[:id]) 
    if authorized?(comment)
      comment.update(content: params[:content]) ? render(json: comment.to_json) : render(json: { errors: comment.errors })
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if authorized?(comment) && comment.destroy
      render json: comment.to_json
    end
  end

  private

  def create_comment_params
    params
      .require(:comment)
      .permit(:content, :piece_id)
      .merge(user_id: @current_user_id, group_id: @user_group[:group_id], author_alias: @user_group[:alias])
  end

end
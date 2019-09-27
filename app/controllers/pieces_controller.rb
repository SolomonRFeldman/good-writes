class PiecesController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @piece = Piece.new
  end

  def create
    if @current_user
      @piece = Piece.create(piece_params.merge({user_id: @current_user.id}))
      redirect_to user_path(@current_user)
    end
  end

  private
 
  def piece_params
    params.require(:piece).permit(:title, :content, :form)
  end

end
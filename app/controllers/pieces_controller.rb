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

  def edit
    @piece = Piece.find_by(id: params[:id])
    redirect_to root_path unless @piece && (session[:user_id] == @piece.user_id)
  end

  def update
    @piece = Piece.find_by(id: params[:id])
    @piece.update(piece_params) if @piece && (session[:user_id] == @piece.user_id)
    redirect_to user_path(@current_user)
  end

  private
 
  def piece_params
    params.require(:piece).permit(:title, :content, :form)
  end

end
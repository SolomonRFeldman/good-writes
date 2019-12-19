class PiecesController < ApplicationController

  def create
    if @current_user_id
      piece = Piece.new(piece_params.merge({user_id: @current_user_id}))
      piece.save ? render(json: piece.to_json) : render(json: { errors: piece.errors })
    end
  end

  def show
    piece = Piece.find_by(id: params[:id])
    if authorized?(piece)
      render json: piece.to_json
    end
  end

  def update
    piece = Piece.find_by(id: params[:id]) 
    if authorized?(piece)
      piece.update(piece_params) ? render(json: piece.to_json) : render(json: { errors: piece.errors })
    end
  end

  def destroy
    piece = Piece.find_by(id: params[:id])
    if authorized?(piece) && piece.destroy
      render json: piece.to_json
    end
  end

  private
 
  def piece_params
    params.require(:piece).permit(:title, :content, :form)
  end

end
class PiecesController < ApplicationController

  def create
    if user_id = JwtService.decode(request.headers[:Token])[:user_id]
      piece = Piece.new(piece_params.merge({user_id: user_id}))
      if piece.save
        render json: piece.to_json
      end
    end
  end

  def update
    piece = Piece.find_by(id: params[:id]) 
    if (JwtService.decode(request.headers[:Token])[:user_id] == piece.user_id) && piece.update(piece_params)
      render json: piece.to_json
    end
  end

  def show
    piece = Piece.find_by(id: params[:id]) 
    if JwtService.decode(request.headers[:Token])[:user_id] == piece.user_id
      render json: piece.to_json
    end
  end

  private
 
  def piece_params
    params.require(:piece).permit(:title, :content, :form)
  end

end
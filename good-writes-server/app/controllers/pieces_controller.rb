class PiecesController < ApplicationController

  def show
    piece = Piece.find_by(id: params[:id]) 
    if JwtService.decode(request.headers[:Token])[:user_id] == piece.user_id
      render json: piece.to_json
    end
  end

end
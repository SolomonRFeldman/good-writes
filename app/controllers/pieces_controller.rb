class PiecesController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @piece = Piece.new
  end

  def create
    if @current_user
      @piece = Piece.new(piece_params.merge({user_id: @current_user.id}))
      if @piece.save
        redirect_to user_path(@current_user)
      else
        @errors = @piece.errors.messages
        render 'new'
      end
    end
  end

  def edit
    @piece = Piece.find_by(id: params[:id])
    redirect_to root_path unless authorized?(@piece)
  end

  def update
    @piece = Piece.find_by(id: params[:id])
    @piece.assign_attributes(piece_params) if authorized?(@piece)
    if @piece.save
      redirect_to user_piece_path(@current_user, @piece)
    else
      @errors = @piece.errors.messages
      render 'edit'
    end
  end

  def destroy
    @piece = Piece.find_by(id: params[:id])
    @piece.destroy if authorized?(@piece)
    redirect_to user_path(@current_user)
  end

  def show
    @piece = Piece.find_by(id: params[:id])
    redirect_to root_path unless authorized?(@piece)
  end

  private
 
  def piece_params
    params.require(:piece).permit(:title, :content, :form)
  end

end
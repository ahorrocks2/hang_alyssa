class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(style: params[:style])

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

end

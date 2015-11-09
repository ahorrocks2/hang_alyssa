class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @player = Player.where(id: (params[:player]))[0]
  end

  def create
    @game = Game.new(style: params[:commit])
    player = Player.where(name: (params[:player]))
    @player = player[0]

    if @game.save
      redirect_to game_path(@game, player: @player)
    else
      render :new
    end
  end

end

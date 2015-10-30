class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new
    if @game.save
      num = 1 + rand(6)
      @game.rounds << Round.find(num)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.rounds (num)
  end
end

class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @game = Game.new
    if @game.save
      num = rand(18..25)
      @game.rounds << Round.find(num)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

end

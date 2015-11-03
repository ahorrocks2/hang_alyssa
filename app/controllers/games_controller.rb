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
    num = rand(1..6)
    @game.text = Answer.find(num).text
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

end

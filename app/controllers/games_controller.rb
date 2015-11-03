class GamesController < ApplicationController
  helper :display_answer

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new
    num = rand(1..6)
    @game.answer = Answer.find(num).text
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

end

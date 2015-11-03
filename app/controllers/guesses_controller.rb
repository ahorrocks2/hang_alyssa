class GuessesController < ApplicationController
  def new
    @guess = Guess.new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    binding.pry
    @guess = @game.guesses.new(:letter => params[:letter])
    if @guess.save
      redirect_to game_path(@game)
    end
  end



end

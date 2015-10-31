class GuessesController < ApplicationController
  def new
    @guess = Guess.new
  end
  
  def create
    @game = Game.find(params[:game_id])
    @letter = params[:letter]
    @guess = @game.guess.new(guess_params)
    if @guess.save
      redirect_to game_path(@game)
    end
  end

private
  def guess_params
    params.require(:guess).permit(:letter)
  end
end

class GuessesController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(:letter => params[:letter])

    if @game.dead?
      respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.js { render :dead }
      end
    else
      @guess.save
      @guess.check_guess
      respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.js
      end
    end
  end

end

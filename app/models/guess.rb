class Guess < ActiveRecord::Base
  belongs_to :game
  validates_presence_of :letter

  def check_guess
    self.game.split_answer_to_letters.each do |answer_letter|
      if answer_letter == self.letter
        self.update(:in_answer? => true)
      end
    end
  end

  def update_hearts(game)
    if self.in_answer? == false
      game.hearts -= 1
      game.save
    end
  end
end

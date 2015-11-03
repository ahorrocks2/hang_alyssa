class Guess < ActiveRecord::Base
  belongs_to :game
  validates_presence_of :letter
  after_save :check_guess

  def check_guess
    self.game.answer.each do |answer_letter|
      if answer_letter == self.letter
        self.in_answer? :true
      end
    end
  end
end

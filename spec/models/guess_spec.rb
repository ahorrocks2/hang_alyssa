require 'rails_helper'

describe Guess do
  it { should belong_to :game }
  it { should validate_presence_of :letter }

  it 'check the guess a user inputs to see if it is part of the answer' do
    test_game = Game.create(answer: 'abcd')
    test_guess = test_game.guesses.new(letter: 'A')
    test_guess.check_guess
    expect(test_guess.in_answer?).to(eql(true))
  end
end

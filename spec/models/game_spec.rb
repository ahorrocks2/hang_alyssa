require 'rails_helper'

describe Game do
  it { should have_many :guesses }

  it 'should split the answer attribute into an array of letters' do
    test_game = Game.create(answer: 'abcd')
    expect(test_game.split_answer_to_letters()).to(eql(['A', 'B', 'C', 'D', ' ']))
  end

  it 'should return true if wrong answers more than 5' do
    test_game = Game.create(answer: 'abcd')
    guess1 = test_game.guesses.new(:letter => 'E')
    guess2 = test_game.guesses.new(:letter => 'F')
    guess3 = test_game.guesses.new(:letter => 'G')
    guess4 = test_game.guesses.new(:letter => 'H')
    guess5 = test_game.guesses.new(:letter => 'I')
    guess6 = test_game.guesses.new(:letter => 'J')
    expect(test_game.dead?).to(eql(true))
  end
end

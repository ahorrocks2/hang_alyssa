require 'rails_helper'

describe Game do
  it { should have_many :guesses }

  it 'should split the answer attribute into an array of letters' do
    test_game = Game.create(answer: 'abcd')
    expect(test_game.split_answer_to_letters()).to(eql(['A', 'B', 'C', 'D', ' '])) 
  end
end

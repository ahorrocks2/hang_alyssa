require 'rails_helper'

describe 'the process solve the puzzle' do
  it 'allow user to type in answer and say if it is true' do
    game = Game.create(answer: 'abcde', id: 1)
    visit '/games/1'
    click_on 'Solve'
    fill_prompt 'abcde'
    expect(page).to have_content 'You Got It!'
  end

  it 'allow user to type in answer and say if it is false' do
    game = Game.create(answer: 'abcde', id: 1)
    visit '/games/1'
    click_on 'Solve'
    fill_prompt 'abcdefg'
    expect(page).to have_content 'Nope!'
  end
end

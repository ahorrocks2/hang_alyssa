require 'rails_helper'

describe 'making a guess process' do
  it 'create a guess' do
    game = Game.create(answer: 'abcde', id: 1)
    visit '/games/1'
    click_on 'E'
    expect(page).to have_content 'E'
  end
end

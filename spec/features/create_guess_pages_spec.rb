require 'rails_helper'

describe 'making a guess process' do
  it 'create a guess' do
    visit '/'
    click_on 'Start'
    click_on 'E'
    expect(page).to have_content 'E'
  end
end

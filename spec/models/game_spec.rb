require 'rails_helper'

describe Game do
  it { should have_many :guesses }
end

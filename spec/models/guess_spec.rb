require 'rails_helper'

describe Guess do
  it { should belong_to :game }
  it { should validate_presence_of :letter }
end

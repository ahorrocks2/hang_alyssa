require 'rails_helper'

describe Game do
  it { should have_one :word }
end

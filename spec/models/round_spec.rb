require 'rails_helper'

describe Round do
  it { should validate_presence_of :text }
  it { should belong_to :game }
end

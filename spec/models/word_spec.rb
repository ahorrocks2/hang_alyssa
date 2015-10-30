require 'rails_helper'

describe Word do
  it { should validate_presence_of :text }
end

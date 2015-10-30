class Guess < ActiveRecord::Base
  belongs_to :game
  validates_presence_of :letter
end

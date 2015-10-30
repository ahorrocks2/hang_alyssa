class Round < ActiveRecord::Base
  validates_presence_of :text
  belongs_to :game

end

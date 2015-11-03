# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
word_list = [
  "No man is an island",
  "Revenge is best served cold",
  "All dogs go to heaven",
  "Fortune favors the bold",
  "When the going gets tough the tough get going",
  "Birds of a feather flock together"
]

word_list.each do |text|
  Answer.create( text: text )
end

class Game < ActiveRecord::Base
  has_many :guesses

  def split_answer_to_letters
    letters_array = []

    words = self.answer.upcase.split(" ")

    words.each do |word|
      letters = word.split("")
      letters.each do |letter|
        letters_array.push(letter)
      end
      letters_array.push(" ")
    end

    return letters_array
  end

end

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

  def assign_answer
    num = rand(1..6)
    self.answer = Answer.find(num).text
    self.save
  end

  def dead?
    wrong_answers = 0

    self.guesses.each do |guess|
      if guess.in_answer? == false
        wrong_answers += 1
      end
    end

    if wrong_answers < 6
      return false
    else
      return true
    end
  end

end

class Game < ActiveRecord::Base
  attr_accessor :style
  require 'random_word_generator'

  has_many :guesses
  before_save :generate_answer

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



  def dead?
    wrong_answers = 0

    self.guesses.each do |guess|
      if guess.in_answer? == false
        wrong_answers += 1
      end
    end

    if wrong_answers < 6
      return false
    elsif wrong_answers > 5 && (self.guesses.last.in_answer? == false)
      return true
    end
  end


  def display_answer
    if self.dead? == false
      answer_array = []
      correct_guesses_array = []

      self.guesses.each do |guess|
        if guess.in_answer?
          correct_guesses_array.push(guess.letter)
        end
      end

      self.split_answer_to_letters.each do |letter|
        if letter != ' ' && letter != '-'
          if correct_guesses_array.include?(letter)
            answer_array.push(letter)
          else
            answer_array.push("[_]")
          end
        elsif letter == '-'
          answer_array.push('-')
        elsif letter == ' '
          answer_array.push('  ')
        else
          3.times do
            answer_array.push(' ')
          end
        end
      end

      return answer_array
    else
      return self.answer
    end
  end


  def won?
    display = self.display_answer

    if (self.dead? == false) && (display.exclude?('[_]'))
      return true
    else
      return false
    end
  end

private
  def generate_answer
    #if the user chooses 'street smart' it generates a country name
    if self.style == 'street'
      answer_text = Faker::Address.country
      Answer.create(text: answer_text)
      self.answer = Answer.last.text

    else
    #if the user chooses 'book smart' it generates a dictionary word
      answer_text = RandomWordGenerator.word
      Answer.create(text: answer_text)
      self.answer = Answer.last.text
    end
  end

end

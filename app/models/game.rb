class Game < ActiveRecord::Base
  has_many :guesses
  before_save :generate_answer
  attr_accessor :style

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
          answer_array.push(' ')
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
    if (self.dead? == false) && (display == self.answer || display.exclude?('[_]'))
      binding.pry()
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
    #if the user chooses 'book smart' it generates a diction word
      random_num = rand(1..50000)
      answer = RestClient::Request.new(
        :method => :get,
        :url => "https://api.pearson.com:443/v2/dictionaries/ldoce5/entries?offset=#{random_num}&limit=1"
      ).execute

      parsed_answer = JSON.parse(answer)
      final_answer = parsed_answer['results'].first['headword']

    #if the word generated has a space or a comma, re-query
      if (final_answer.split("").include?(",")) || (final_answer.split("").include?(' '))
        new_random_num = rand(1..50000)
        new_answer = RestClient::Request.new(
        :method => :get,
        :url => "https://api.pearson.com:443/v2/dictionaries/ldoce5/entries?offset=#{new_random_num}&limit=1"
        ).execute

        new_parsed_answer = JSON.parse(answer)
        new_final_answer = new_parsed_answer['results'].first['headword']
        Answer.create(text: new_final_answer)
        self.answer = Answer.last.text
      else
        Answer.create(text: final_answer)
        self.answer = Answer.last.text
      end
    end
  end

end

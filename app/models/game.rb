class Game < ActiveRecord::Base
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

private
  def find_new_answer(game)
    random_num = rand(1..50000)
    answer = RestClient::Request.new(
    :method => :get,
    :url => "https://api.pearson.com:443/v2/dictionaries/ldoce5/entries?offset=#{random_num}&limit=1"
    ).execute

    parsed_answer = JSON.parse(answer)
    final_answer = parsed_answer['results'].first['headword']
    Answer.create(text: final_answer)
    self.answer = Answer.last.text
  end

  def generate_answer
    random_num = rand(1..50000)
    answer = RestClient::Request.new(
      :method => :get,
      :url => "https://api.pearson.com:443/v2/dictionaries/ldoce5/entries?offset=#{random_num}&limit=1"
    ).execute

    parsed_answer = JSON.parse(answer)
    final_answer = parsed_answer['results'].first['headword']

    if final_answer.split("").include?(",") || final_answer.split("").include?(" ")
      self.find_new_answer(self)
    else
      Answer.create(text: final_answer)
      self.answer = Answer.last.text
    end
  end

end

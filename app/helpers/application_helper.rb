module ApplicationHelper
  def hide_letters(text)
    phrase_array = []
    word_array = []

    text.upcase!
    words = text.split(" ")

    words.each do |word|
      letters = word.split("")
        letters.each do |letter|
        word_array.push('[_]')
      end
      word_array.join("")
      phrase_array.push(word_array.join)
      word_array = []
    end

    return phrase_array.join(" ")
  end
  
end

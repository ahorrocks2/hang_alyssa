module DisplayAnswerHelper
  def display_answer(game)
    if game.dead? == false
      answer_array = []
      correct_guesses_array = []

      game.guesses.each do |guess|
        if guess.in_answer?
          correct_guesses_array.push(guess.letter)
        end
      end

      game.split_answer_to_letters.each do |letter|
        if letter != ' '
          if correct_guesses_array.include?(letter)
            answer_array.push(letter)
          else
            answer_array.push('[_]')
          end
        else
          3.times do
            answer_array.push(' ')
          end
        end
      end

      return answer_array.join("")
    else
      return game.answer
    end
  end

end

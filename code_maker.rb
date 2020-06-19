require 'colorize'
class CodeMaker
  attr_reader :colors 
  attr_accessor :outcomes
  def initialize
    @colors = [' 1 '.on_red, ' 2 '.on_green, ' 3 '.on_yellow.black, ' 4 '.on_blue, ' 5 '.on_magenta, ' 6 '.on_cyan]
  end

  def give_feedback(code, guess)
    @code = code
    @outcomes = [00]
    guess = guess.split('')
    int_guess = guess.map do |guesses|
      guesses.to_i
    end
    removed_already = []
    filtered_guess = []
    feedback_letters = []
    code.each_with_index do |item, index|
      if item.to_i == int_guess[index]
        feedback_letters << 'R'
        @outcomes[0] += 10
      else 
        removed_already << item.to_i
        filtered_guess << int_guess[index]
      end
    end
    for i in (0...filtered_guess.length) do
      if filtered_guess.include?(removed_already[i])
        feedback_letters << 'W'
        @outcomes[0] += 1
      end
    end
    feedback_letters
  end

  def computer_secret_code
    secret_code = 4.times.map {[1,2,3,4,5,6].sample}
    secret_code
  end
end
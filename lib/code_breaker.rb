# frozen_string_literal :true

class CodeBreaker
  def initialize
    code_maker = CodeMaker.new
    @colors = code_maker.colors
  end

  def guess_output(guess, string = 'Your')
    array = [1, 2, 3, 4, 5, 6]
    guess = guess.split('')
    print "#{string} guess was "
    guess.each do |item|
      print @colors[item.to_i - 1] + ' ' if array.include? item.to_i
    end
    puts ''
  end
end

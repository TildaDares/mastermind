class CodeBreaker
    def initialize
      code_maker = CodeMaker.new
      @colors = code_maker.colors
    end

    def guess_output(guess, string='Your')
      array = [1,2,3,4,5,6]
      output_colors = []
      guess = guess.split('')
      print "#{string} guess was "
      guess.each do |item|
        if array.include? (item.to_i)
          print @colors[item.to_i - 1] + ' '
        end
      end
      puts ''
    end
end
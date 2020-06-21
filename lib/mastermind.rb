require 'colorize'
require_relative 'game_info'
require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'computer_code_breaker'
class MasterMind

  def play_mode
    instructions = GameInfo.new
    secret_code, mode = instructions.game_instructions
    code_maker = CodeMaker.new
    comp_code_breaker = Computer.new
    code_breaker = CodeBreaker.new
    if mode == '1'
      12.times do |i|
        puts "You have made #{i} guesses"
        puts 'Enter your guess'
        guess = gets.chomp
        while (guess.length > 4 || guess.length < 4) || (/[0789]/ =~ guess)
          puts 'Enter your guess (only four numbers from 1-6 are allowed)'
          guess = gets.chomp
        end
        code_breaker.guess_output(guess)
        puts ''
        letters = code_maker.give_feedback(secret_code, guess)
        if letters.join('') == 'RRRR'
          puts 'You win!'
          puts "Nailed it in #{i+1} guesses"
          return
        else
         print 'Feedback is: '
          for i in (0...letters.length) 
            if letters[i] == 'R'
              print '  '.on_red + ' '
            else
              print '  '.on_white + ' '
            end
          end
          puts "\n\n"
       end
     end
     puts "Better luck next time :("
   else
    change_secret_code_to_i = secret_code.split('').map do |code|
                                  code.to_i
                               end
    12.times do |i|
      guess = comp_code_breaker.knuth_algo(i+1)
      code_breaker.guess_output(guess, "Computer's")
      letters = code_maker.give_feedback(change_secret_code_to_i, guess)
        if letters.join('') == 'RRRR'
          puts 'Computer wins!'
          puts "Nailed it in #{i+1} guesses"
          return
        else
         print 'Feedback is: '
          for i in (0...letters.length) 
            if letters[i] == 'R'
              print '  '.on_red + ' '
            else
              print '  '.on_white + ' '
            end
          end
        end
        puts "\n\n"
      comp_code_breaker.prune_possible_answers(guess, code_maker.outcomes)
     end
   end
   puts 'Computer loses :('
  end
end

master = MasterMind.new
master.play_mode

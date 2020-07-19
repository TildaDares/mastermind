# frozen_string_literal :true

require 'colorize'
require_relative 'code_maker'
class GameInfo
  def game_instructions
    code_maker = CodeMaker.new
    print "We'll be playing a game called " + 'M'.blue + 'A'.red + 'S'.green + 'T'.blue
    print 'E'.white + 'R'.blue + 'M'.green + 'I'.yellow + 'N'.blue + 'D'.red
    puts ''
    puts <<-HEREDOC
       The rules are pretty simple. There are two game modes:
          1. Codebreaker
          2. Codemaker
    HEREDOC
    sleep(2)
    puts ' There are six colored pegs represented with numbers'
    print ' 1 '.on_red + ' '
    print ' 2 '.on_green + ' '
    print ' 3 '.on_yellow.black + ' '
    print ' 4 '.on_blue + ' '
    print ' 5 '.on_magenta + ' '
    print ' 6 '.on_cyan + ' '
    puts ''
    sleep(1)
    puts <<-HEREDOC
      You can either create a secret code with four of the color pegs (could be duplicate pegs)
      and then the computer will attempt to guess the code or you could decide to break the computer's
      secret code in twelve turns. If you choose to be the codebreaker then on each guess you will be clues
      that'll tell you how good your guess was.
    HEREDOC
    puts ''
    print 'A white peg ' + '  '.on_white
    print ' indicates the existence of a correct color code peg placed in the wrong position.'
    puts ' A red peg ' + '  '.on_red
    print ' is placed for each code peg from the guess which is correct in both color and position'
    puts ''
    sleep(1)
    puts 'For example if the secret color code is ' + ' 4 '.on_blue + ' 1 '.on_red + ' 3 '.on_yellow.black + ' 4 '.on_blue
    puts 'And your guess is 2436 then the clue would be ' + '  '.on_white + ' ' + '  '.on_red
    puts "Let's get started :)"
    puts ''
    puts <<-HEREDOC
      What would you like to be?:
        1. Codebreaker
        2. Codemaker
    HEREDOC

    game_mode = gets.chomp
    until /^[12]$/ =~ game_mode
      puts 'Please enter either 1 or 2'
      game_mode = gets.chomp
    end

    if game_mode == '1'
      puts 'Computer is creating secret code...'
      sleep(2)
      return code_maker.computer_secret_code, game_mode
    end

    if game_mode == '2'
      secret_code = ''
      while (secret_code.length > 4 || secret_code.length < 4) || (/[0789]/ =~ secret_code)
        puts 'What will your code be? (only four numbers from 1-6 are allowed)'
        print ' 1 '.on_red + ' '
        print ' 2 '.on_green + ' '
        print ' 3 '.on_yellow.black + ' '
        print ' 4 '.on_blue + ' '
        print ' 5 '.on_magenta + ' '
        print ' 6 '.on_cyan + ' '
        puts ''
        secret_code = gets.chomp
      end
      [secret_code, game_mode]
    end
  end
end

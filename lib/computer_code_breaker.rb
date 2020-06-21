class Computer
  def initialize
    permutations = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
    @possible_answers = permutations.map {|answer| answer.join('')}
    @@pruned_answers = permutations.map {|answer| answer.join('')}
    @outcomes = [00, 01, 02, 03, 04, 10, 11, 12, 13, 20, 21, 22, 31, 40]
  end

  def prune_possible_answers(guess, feedback)
    code_maker = CodeMaker.new
    code_breaker = CodeBreaker.new
    @remove_these = []
    @possible_answers.delete(guess)
    @@pruned_answers.delete(guess)
    @possible_answers.each do |answer|
      code_maker.give_feedback(answer.split(''), guess)
      @remove_these << answer unless code_maker.outcomes == feedback
    end
    @remove_these.each do |delete_member|
      @@pruned_answers.delete(delete_member)
    end
  end

  def knuth_algo(turn)
    code_maker = CodeMaker.new
    code_breaker = CodeBreaker.new
    nextGuess = ''
    guess_hash = []
    guesses = []
    min = 100000
    if turn == 1
      return '1122'
    else
      @@pruned_answers.each do |guess|
        max = 0
        @outcomes.each do |outcome|
          count = 0
          @@pruned_answers.each do |answer|
            code_maker.give_feedback(answer.split(''), guess)
            count += 1  if code_maker.outcomes.join().to_i == outcome
          end
           if count > max
              max = count 
              guess_hash << max
              guesses << guess
           end
        end
     end 
     nextGuess = guesses[guess_hash.index(guess_hash.min)]
     nextGuess
   end
  end
end
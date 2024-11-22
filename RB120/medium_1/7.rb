=begin
In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

Range#cover? is like #include?, but faster for ranges.
=end

class GuessingGame
  def initialize(low, high)
    @low = low
    @high = high
    @winning_number = (@low..@high).to_a.sample
    @total_guesses = calculate_guesses
  end

  def play
    play_game
    display_game_outcome
  end

  private

  def play_game
    loop do
      display_remaining_guesses
      ask_for_guess
      display_guess_result
      decrement_total_guesses
      break if correct_guess? || no_guesses_remaining?
    end
  end

  def size_of_range
    (@low..@high).size
  end
  
  def calculate_guesses
    (Math.log2((@low..@high).size).to_i + 1)
  end

  def display_remaining_guesses
    puts "You have #{@total_guesses} #{@total_guesses == 1 ? 'guess' : 'guesses'} remaining."
    puts ""
  end

  def ask_for_guess
    loop do
      print "Enter a number between #{@low} and #{@high}: "
      @guess = gets.to_i
      break if (@low..@high).cover?(@guess)
      print "Invalid guess. "
    end
  end

  def display_guess_result
    result = case @guess
            when (@low...@winning_number)    then "Your guess is too low."
            when (@winning_number+1..@high) then "Your guess is too high."
            else                               "That's the number!"
            end

    puts result
    puts ""
  end

  def display_game_outcome
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost! " \
      "The number was #{@winning_number}."
    end
  end

  def decrement_total_guesses
    @total_guesses -= 1
  end

  def no_guesses_remaining?
    @total_guesses == 0
  end

  def correct_guess?
    @guess == @winning_number
  end
end

game = GuessingGame.new(501, 1500)
game.play
=begin
# Number Guesser Part 1
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 total_guesses per game. The game should play like this:

loop
  - display remaining total_guesses
  - ask user for number between 1-100
    - display error message if outside of range
  - check guess
    - if too low -> display too low
    - if too high -> display too high
    - if win: set game_won? to true break from loop
  - Display if guess is too low or two high
  - decrement remaining total_guesses
  break if remaining total_guesses == 0
end

if game_won?
  display game won
otherwise
  you lost
=end

class GuessingGame
  def initialize
    @winning_number = rand(101)
    @total_guesses = 7
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
      # break if correct_guess?
      display_guess_result
      decrement_total_guesses
      break if correct_guess? || no_guesses_remaining?
    end
  end

  def display_remaining_guesses
    puts "You have #{@total_guesses} #{@total_guesses == 1 ? 'guess' : 'guesses'} remaining."
    puts ""
  end

  def ask_for_guess
    loop do
      print "Enter a number between 1 and 100: "
      @guess = gets.to_i
      break if (1..100).include?(@guess)
      print "Invalid guess. "
    end
  end

  def display_guess_result
    result = case @guess
            when (1...@winning_number)    then "Your guess is too low."
            when (@winning_number+1..100) then "Your guess is too high."
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

game = GuessingGame.new
game.play
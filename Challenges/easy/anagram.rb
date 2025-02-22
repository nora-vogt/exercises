require 'pry'
=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.


RULES:
- words are anagrams if they have the same length, same letters, and exact number of same letters
  - aka: words are anagrams if they are identical when sorted (case insensitive)
- possible matches will be given as strings in an array
- anagrams are case insensitive
- idential words are not anagrams, i.e. 'corn' is given, [corn, cron] are potentials, only [cron] is the anagram
- the result array must:
  - preserve the original case of the match


# Data Structures
# constructor - string

# match - array

# Algo

# constructor - takes a string, @word

# match - takes an array of strings
  # called by an instance of Anagram
  # returns an array of strings that are anagrams
  # anagrams must be unique -> aka "Cron" -> "corn", "CORN" -> only one anagram, "corn"

- iterate through array of strings
  - for each string, determine if its an anagram
  - if yes: select the string
- remove duplicates from selected array

# anagram?
  - return false if the potential match word is the same as @word
  - checks if downcased, sorted word is equivalent to @word downcased + sorted
=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    array.select { |word| anagram?(word) }
  end

  private

  def anagram?(other_word)
    return false if @word == other_word.downcase
    word.chars.sort == other_word.downcase.chars.sort
  end
end

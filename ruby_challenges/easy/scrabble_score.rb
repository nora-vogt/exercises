require 'pry'
=begin
PROBLEM:
Write a program that, given a word, computes the Scrabble score for that word.

Letter values:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

Rules:
- to score the word, sum the values of each letter in the word
- scores are case-insensitive
  - convert all to uppercase
- an empty string scores 0
- given nil scores 0
- non-alpha chars?
  - whitespace characters score 0
  - strings appear to only contain letters or spaces


EXAMPLES:
word: CABBAGE => 14
    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E


QUIRKY => 22
10 + 1 + 1 + 1 + 5 + 4


Data Stuctures/Algo:
- create a hash
  - points are keys, values are upcase letters associated with points

#constructor - takes a string (empty or value) OR nil
  - if given nil, assign an empty string
  - assign the upcased value to @word

#score
# LS Solution adds a line that uses #gsub to remove anything that isn't an uppercase character from the word. We don't have any test cases to demo this, though. like: 'TR7&EE'

- set sum to 0
- iterates through POINTS hash, for each k,v (value, letters)
  - count the number of letters that exist in word
    - iterate through an array of chars in word, #count
      - if letters includes the char, count that char
  - multiply value times that count
  - increment sum by the result

- return the sum

# Scrabble#score - string arg
  - creates a new Scrabble instance from string
  - calls #score on the new instance

=end

class Scrabble
  POINTS = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  attr_reader :word

  def initialize(word)
    @word = word ? word.upcase : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    sum = 0
    POINTS.each do |value, letters|
      count = word.count(letters.join) # refactor* 
      sum += (value * count)
    end
    sum
  end
end

=begin
previous code - line 91: #count = word.chars.count { |letter| letters.include?(letter) }
Refactor notes:
#count takes *selectors as an argument
- When we pass a string with mutliple letters, #count will count the occurrences of each letter
- this is faster than using #include? for each letter
=end

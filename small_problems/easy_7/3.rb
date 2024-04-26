require 'pry'
=begin
PROBLEM
Input:
- string

Output:
- new string

Rules:
- words are any sequence of non-blank characters
- new string should have original value of argument, with first character of every word words
- all other chars of word except first should be lowercase
- if the word is surrounded by double quotes "", do not capitalize it (This Is A "quoted" Word)
- if there is capitalization mid-word (ex: javaScript), remove it (Javascript)

Qs:
- What should an empty string return?
- What happens if a word begins with a number? 123hello
- can we use String#capitalize?

EXAMPLES
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

this is a "quoted" word

this, is, a, "quoted", word
start with "" -> don't capitalize
This Is A "quoted" Word

DATA STRUCTURE
start: string
middle: array
end: new string

ALGORITHM
Given a string, "string"
- create a constant LETTERS that references an array of all uppercase and lowercase characters a-z
- create an array "words" to reference an empty array
- Break the given string into component words on whitespace
  - assign to "words"
- Iterate through words
  - check if LETTERS includes words[0]
  - if yes: capitalize the word (first char uppercase, rest lowercase)
  - if no: do nothing
- join the strings in words back into single string, separated by spaces
- return new string
=end

# LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

# # Original
# def word_cap(string)
#   words = string.split(' ')
#   words.each do |word|
#     LETTERS.include?(word[0]) ? word.capitalize! : word
#   end.join(' ')
# end

# # Refactored
# def word_cap(string)
#   string.split(' ').each do |word|
#     word.capitalize! if LETTERS.include?(word[0])
#   end.join(' ')
# end

# # Solution 2
# # Don't actually need to check if first char is a letter.
# # when word is surrounded by double quotes within string, it won't be capitalized. Same if word starts with numbers.

# def word_cap(string)
#   string.split(' ').map(&:capitalize).join(' ')
# end

# Further Exploration
# Two solutions to solve this without String#capitalize

# capitalize first letter (if alphabetic)
# downcase all other letters in word (if alphabetic)
# need to transform characters of each word

# split string into array of words on whitespace
  # split word into array of chars - transform
      # capitalize first char if a letter
      # downcase all remaining chars if a letter 
  # returns an array of transformed chars - join it
# outer block returns new array of transformed chars - join it

# Avoiding any built-in String methods
# If branch - used to upcase first char:
  # if it's the first char (index == 0), if char is a valid key in letters (meaning char is lowercase), return the uppercase value. If falsy, that means char is already uppercase or is non-alphabetic, so return char. 

# else branch - used to downcase rest of word:
  # does array of values include char (meaning char is a capital letter)
  # return the key associated with char value (lowercase)
  # if not, char is already lowercase or is non-alphabetic, so return char

# def generate_alphabet_hash
#   uppercase = ('A'..'Z').to_a
#   ('a'..'z').to_a.each_with_object({}).with_index do |(char, hash), index|
#     hash[char] = uppercase[index]
#   end
# end

# Cool Refactor
# Array.zip returns a nested array: each sub-array is element at index X from caller and arg arrays ex: [['a', 'A'], ['b', 'B']]
# Hash::[] - pass one array arg that contains 2-element sub-arrays, returns a new Hash where each 2-element array forms key/value pairs

def generate_alphabet_hash
  Hash[('a'..'z').zip('A'..'Z')]
end

def word_cap(string)
  letters = generate_alphabet_hash
  string.split(' ').map do |word|
    word.chars.map.with_index do |char, index|
      if index == 0
        letters[char] ? letters[char] : char
      else 
        letters.values.include?(char) ? letters.key(char) : char
      end
    end.join
  end.join(' ')
end



# Further Exploration 2:
def generate_alphabet_hash
  uppercase = ('A'..'Z').to_a
  ('a'..'z').to_a.each_with_object({}).with_index do |(char, hash), index|
    hash[char] = uppercase[index]
  end
end

def word_cap(string)
  letters = generate_alphabet_hash
  string.split(' ').map(&:downcase).each do |word|
    word[0] = letters[word[0]] if letters.keys.include?(word[0])
  end.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
p word_cap('testing hey123hey') == ('Testing Hey123hey')
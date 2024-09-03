=begin
Word to Digit

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

RULES:
- convert any number-word to its digit equivalent
  - zero-nine
- some numbers may be followed by punctuation
- string is made of words - separated on whitespace. 
- Preserve spaces between digits.

EXAMPLES:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

DATA STRUCTURES:
Input: String of words

reference hash 
  - number-words are keys, values are string digits

array of words in string

new string to build

Output: same string - number-words transformed to digits

BRAINSTORM:
- create the hash { zero => 0, one => 1 ...}
-make array of words [please call me ... five ... four.]

Regex solution:
- iterate through hash
  - if key matches any word in string
  - replace it with the corresponding value

ALGORITHM:
Given a string,
- CREATE reference hash
  - keys are number-words
  - values are string-digits
- ITERATE through reference hash
  - IF the current key (number-word) exists in the string,
    - replace it with the corresponding value
- RETURN the string
=end

def initialize_word_digit_hash1
  words = %w(zero one two three four five six seven eight nine)
  digits = ('0'..'9').to_a
  words.zip(digits).to_h
end

def word_to_digit2(string)
  word_digits = initialize_word_digit_hash

  word_digits.each do |word, digit|
    string.gsub!(/\b#{word}\b/, digit)
  end

  string
end

=begin
BRAINSTORM 2 - NON-REG-EX:
- reference hash
- array of words in string
- iterate through array of words [three four.]
  - IF the last char of the word is a period
    - IF the slice of word from idx 0 to -2 matches a key in ref hash
      - REASSIGN slice of word from idx 0 to -2 to the corresponding value in ref hash
  - OTHERWISE
    - IF word matches a key in ref hash, reassign to corresponding value
    - otherwise do not alter the word
- join array of words back into a string

# this solution doesn't mutate original string
=end

def word_to_digit2(string)
  word_digits = initialize_word_digit_hash
  words = string.split

  words.each do |word|
    if word[-1] == '.'
      word_without_punctuation = word[0..-2]
      if word_digits.keys.include?(word_without_punctuation)
        word[0..-2] = word_digits[word_without_punctuation]
      end
    elsif word_digits.keys.include?(word)
      word.replace(word_digits[word])
    end
  end
  words.join(' ')
end

=begin
# Further Exploration
# first: replace uppercase/lowercase words both 
  - Add the i flag after regex slashes to indicate case-insensitive match \b/#{number}\b/i

# Change solution so spaces between consecutive numbers are removed
  # If string already contains two space-separated numbers (not words), leave those spaces alone
  # Only remove spaces between numbers you create. Remove spaces when:
    # word is replaced by digit - followed by whitespace - followed by another word replaced by digit
    # do not remove whitespace after last word replaced by digit
    #

  # five five five. => 555.
  # five five five hello => 555 hello
  # 4 6 hey there seven eight nine, 8 8 => 4 6 hey there 789, 8 8 

  # still in progress, how to differentiate from pre-existing space-separated numbers, vs. numbers that i create. need to not use regex i think.
=end

def initialize_word_digit_hash
  words = %w(zero one two three four five six seven eight nine)
  digits = ('0'..'9').to_a
  words.zip(digits).to_h
end

def word_to_digit(string)
  word_digits = initialize_word_digit_hash

  word_digits.each do |word, digit|
    string.gsub!(/\b#{word}\b/i, digit)
  end

  string.gsub!(/\d\s\d/) { |match| p match }
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# p word_to_digit('Please call me at FIVE five FiVe one TWO three FOur. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('five five five.') == '555.'
p word_to_digit('five five five hello') == '555 hello'
p word_to_digit('4 6 hey there seven eight nine, 8 8') == '4 6 hey there 789, 8 8'
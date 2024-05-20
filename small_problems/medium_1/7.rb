=begin
Input: string
Output: string with number-words converted to string digits

Problem:
Given a string, find the words that are spelled-out numbers_hash (zero-nine) and replace each number with it's string digit equivalent. (zero => 0)

Rules:
- Return the same string value except replace number words with digits.
- preserv spaces between numbers_hash in soution
- need to split punctuation into its own character

Qs:
- should this solution return a new string object or the original string object?

ALGORITHM:
given a string, "sentence"
- SET "numbers_hash" to a hash where keys are string number word and values are corresponding string digit
- Split the sentence into an array of words on whitespace
- SET words to this array of words
- iterate through numbers_hash hash
  - for each word (key), substitute all occurrences in string with digit (value)
- join the words array into a string
- return that string
=end

# def create_numbers_hash
#   words = %w(zero one two three four five six seven eight nine)
#   digits = ('0'..'9').to_a
#   words.zip(digits).to_h
# end

# # First solution - fulfulls test case but misses edge cases - will convert matching substrings to digits. "Freight" becomes "Fr8"
# def word_to_digit(sentence)
#   numbers_hash = create_numbers_hash
#   numbers_hash.each do |word, digit|
#     sentence.gsub!(word, digit)
#   end
#   p sentence
# end

# # Refactor is basically same solution as LS
# def word_to_digit(sentence)
#   numbers_hash = create_numbers_hash
#   numbers_hash.each do |word, digit|
#     sentence.gsub!(/\b#{word}\b/, digit)
#   end
#   p sentence
# end

# LS Solution
# create digits hash (like I did)
  # itearte through an array of keys in the digits hash
  # invoke #gsub! on the argument string
    # pattern is /\b#{word}\b
      # word to look for is interpolated in regex #{word}
      # \b limits operation to complete words, not substrings (prevents "freight" from becoming "fr8")
    # replacement is DIGIT_HASH[word] (hash value associated with word key)

# DIGIT_HASH = {
#   'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
# }.freeze

# def word_to_digit(sentence)
#   DIGIT_HASH.keys.each do |word|
#     sentence.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
#   end
#   p sentence
# end

# Further Exploration
# Change solution so spaces between consecutive numbers are removed
  # If string already contains two space-separated numbers (not words), leave those spaces alone
  # Only remove spaces between numbers you create. Remove spaces when:
    # word is replaced by digit - followed by whitespace - followed by another word replaced by digit
    # do not remove whitespace after last word replaced by digit
    #

  # five five five. => 555.
  # five five five hello => 555 hello
  # 4 6 hey there seven eight nine, 8 8 => 4 6 hey there 789, 8 8 
  

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('five five five.') == '555.'
p word_to_digit('five five five hello') == '555 hello'
p word_to_digit('4 6 hey there seven eight nine, 8 8') == '4 6 hey there 789, 8 8'
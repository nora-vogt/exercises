=begin
PROBLEM:
Input:
- string (of words)

Output:
- string (second to last word in string)

Rules:
- words are any sequence of non-blank characters
- string will always contain at least two words
- words are separated by spaces

EXAMPLES:
last word => last

Launch School is great! => is

DATA STRUCTURE
start: string
end: new string

ALGORITHM:
- split the given string into array of words, separate on whitespace
- return the second to last element in that array
=end

def penultimate(string)
  string.split(' ')[-2]
end

def penultimate(string)
  string.split(' ').last(2).first
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

=begin
# Further Exploration
# Write a method that retrieves the middle word of a phrase/sentence

Edge cases:
- a string with an even number of words has no middle -> return middle two words in an array (for fun)

ex: "the sky is blue" -> ["sky", "is"]

- a string with just one word -> return that one word
- an empty string -> return an empty string

DATA STRUCTURE:
start: string
end: string or array

ALGORITHM:
given a string
- check if:
  - string is empty -> return an empty string
  - string has length 1 -> return string (but new string)
  - string length is even
    - return the middle two words in an array
  - string length is odd
    - return the middle word

** return middle two words in array **
given an array of even length
get length

the sky is blue
length = 4
4 / 2 = 2 (end index) - 1
split to array
arr[length/2 - 1, 2]

** return middle word in an odd # array **
the sky is not blue
=> is
split into array

array.length / 2 = 2 [middle index]

7-length string
7 / 2 = 3 [middle index; fourth word - three on each side]
=end

def middle_word(string)
  words = string.split
  length = words.length
  result = if string.empty?
    ''
  elsif length == 1
    string
  elsif length.even?
    words[length/2 - 1, 2]
  else
    words[length/2]
  end
  result
end
# also works without checking for length == 1
# ['hello'] length = 1 => 1 / 2 = 0 - returns element at index 0

p middle_word('') == ''
p middle_word('hello') == 'hello'
p middle_word("the sky is blue") == ['sky', 'is']
p middle_word('I went for a walk.') == 'for'
p middle_word('Today I made a great discovery, wow!') == 'a'
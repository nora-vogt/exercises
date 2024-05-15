=begin
PROBLEM
Given a string, find all substrings that start at the first character of the string. Return these substrings ordered shortest to longest in an array.

Input: string
Output: array of substrings

Rules:
- Given one letter string, return an array with a 1-letter substring
- Substrings start at first character of string
- order substrings from shortest to longest length

Data structure:
start: string
middle: array
end: array

ALGORITHM:
Given a string, "string"
- set "substrings" to empty array []
- get all susbtrings starting at first character
  - start a loop
  - set "length" to 1
  - get slices of string starting at index 0, length long
  - add slice to substrings
  - increment length by 1
  - stop looping when length == string.length
- return substrings array (they will already be sorted in order of length shortest to longest)
=end

# First solution - #upto using block param as length (number of chars)
def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |length|
    substrings << string[0, length]
  end
  substrings
end

# Second Solution - loop
def leading_substrings(string)
  substrings = []
  length = 1
  loop do
    substrings << string[0, length]
    length += 1
    break if length > string.length
  end
  substrings
end

# LS Solution - #upto using block param as index
def leading_substrings(string)
  substrings = []
  0.upto(string.length - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

# Student solution - Array::new
def leading_substrings(string)
  Array.new(string.size) { |index| string[0..index] }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
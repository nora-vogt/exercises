=begin
Problem: write a method that returns an array containing all substrings from given string that are palindromes.

Input: string
output: array of palindromic substrings

Rules:
- use the substrings method from previous exercise
- a palindrome is a string that is the same forwards and backwards
- order palindromes in returned array in the same sequence as substrings appear in given string
- include duplicate palindromes multiple times
- palindromes are case sensitive (AbcbA is a palindrome, Abc-bA and Abcba are NOT)
- single characters are not palindromes
- do not ignore whitespace or punctuation in substrings
- return an empty array if no palindrome substrings

# EXAMPLES
abcd = []
madam = [madam, ada]

ALGORITHM:
given a string,
- set "palindromes" to empty array []
- call substrings to get all palindromes, set "substrings" to returned array
- iterate through substrings
  - for each substring, check if it is a palindrome
  - if yes, add to palindromes
  - if no, continue
- return palindromes


- is_palindrome?
  - given a string
  - check if string is longer than 1 character
    - if yes: check if string is the same reversed
      - return true if yes, false if no
    - if no: return false
=end

def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |length|
    substrings << string[0, length]
  end
  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |start_index|
    substrings.concat(leading_substrings(string[start_index..-1]))
  end
  substrings
end

def is_palindrome?(string)
  string.length > 1 && string == string.reverse
end

# Further Exploration
# modify solution to ignore non-alphanumeric characters and case
# def is_palindrome?(string)
#   string = string.downcase.gsub(/[^a-z]/, '')
#   string.length > 1 && string == string.reverse
# end

def palindromes(string)
  substrings = substrings(string)
  palindromes = []
  substrings.each do |string|
    palindromes << string if is_palindrome?(string)
  end
  palindromes
end

# Refactor
def palindromes(string)
  substrings(string).select { |substring| is_palindrome?(substring)}
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
=begin
Problem: Write a method that takes a strign and returns a new string with words from input string in reverse order.

Input: string
Output: new string (words in reverse order)

Rules:
- Given an empty string, return an empty string
- If string contains only whitespace (any # of whitespaces), return an empty string
- preserve case of words/letters

ALGORITHM:
given a string, "string"
- add each word in the string to an array, split on whitespace
- reverse the array
- join the array into a new string
- return new string
=end

# def reverse_sentence(string)
#  string.split.reverse.join(' ')
# end

# def reverse_sentence(string)
#   reversed = []
#   string.split.reverse_each { |word| reversed << word }
#   reversed.join(' ')
# end

# Without using any reverse method
# Array#unshift or Array#prepend to add to beginning
def reverse_sentence(string)
  reversed = []
  string.split.each { |word| reversed.prepend(word) }
  reversed.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
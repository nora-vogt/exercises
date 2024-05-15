=begin
Problem: Write a method that returns a new string, with any words that are 5 or more character in length reversed.

Input: string
Output: new string 

Rules:
- each given string will consist of only letters and spaces
- only include spaces when more than one word is present
- only reverse words that are >= 5 characters in length
- preserve case of given words

ALGORITHM:
- given a string, "string"
- create "result" set to empty array []
- split the string into an array of words
- iterate through the array of words
  - if the current word is >= 5 chars in length, reverse it and add it to "result"
  - otherwise, add current word to result
- join result into a string and return that string
=end

# def reverse_words(string)
#   result = []
#   string.split.each do |word|
#     word = word.size >= 5 ? word.reverse : word
#     result << word
#   end
#   result.join(' ')
# end

# LS Solution
def reverse_words(string)
  words = []
  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

# using #map
def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
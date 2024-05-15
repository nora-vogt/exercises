=begin
Problem: write a method that takes a string, and returns a new string with every consonant character doubled. Do not double any other type of character.

Input: string
Output: new string (only consonants doubled)

Rules:
- only double consonants (all alpha chars except a e i o u)
- do not double any other type of character
- preserve case from input string
- if given an empty string, return an empty string

ALGORITHM:
given a string, "string"
- create "result" set to empty string
- create an array "consonants", add all alphabetic chars except vowels
- iterate through an array of chars from string
  - if consonants includes downcased current char, double the current char and add to "result"
  - otherwise add current char to result
- return result
=end

def consonant?(character)
  vowels = %w(a e i o u)
  consonants = ('a'..'z').to_a.delete_if { |letter| vowels.include?(letter) }
  consonants.include?(character)
end

def double_consonants(string)
  string.chars.map { |char| consonant?(char.downcase) ? char * 2 : char }.join
end

# # LS SOLUTION
# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

# def double_consonants(string)
#   result = ''
#   string.each_char do |char|
#     result << char
#     result << char if CONSONANTS.include?(char.downcase)
#   end
#   result
# end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
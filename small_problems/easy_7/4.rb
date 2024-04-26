require 'pry'
=begin
Input: string
Output: new string, cases swapped

Rules:
- Return a new string
- Uppercase chars should become lowercase
- Lowercase chars should become uppercase
- All other chars should be unchanged
- Do not use String#swapcase

EXAMPLES
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

DATA STRUCTURE:
start: string
middle: array of chars
middle: hash of lower => upper chars
end: string

ALGORITHM:
- Given a string, "string"
- create "letters" to reference array of all upper+lower case alphabetic chars
- Create letter_case hash - to reference alphabet, keys are lowercase, values are uppercase
- split string into array of chars
- iterate through that array, transformation
- check if current char is a letter
  - if no: return current char
  - if yes:
      - check if current char is a key in letter_case
        - if yes, return associated value
        - if no, return the key associated with char value in letter_case
- join transformed array into a string
=end

# First Solution
# def swapcase(string)
#   letters = ('a'..'z').to_a + ('A'..'Z').to_a
#   letter_case = Hash[('a'..'z').zip('A'..'Z')]
#   string.chars.map do |char|
#     if letters.include?(char)
#       letter_case[char] ? letter_case[char] : letter_case.key(char)
#     else
#       char
#     end
#   end.join
# end

# Second solution
def swapcase(string)
  string.chars.map do |char|
      char.upcase! ? char.upcase : char.downcase
  end.join
end

# LS Solution - using String#=~
def swapcase(string)
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
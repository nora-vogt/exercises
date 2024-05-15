=begin
Problem: Write a method that takes a string and returns a new string in which each character is doubled.

Input: string
output: string (with each char from input doubled)

Rules:
- double each char from input sequentially
- preserve case
- need to double whitespaces, punctuation
- if given an empty string, return an empty string

EXAMPLES:
Hello -> HHeelllloo

Data structure:
string, array of chars, string

ALGORITHM:
- Given a string, "string"
- create "result" set to empty string
- create array of chars in string
- iterate through array of chars
  - add current_char * 2 to end of result
- return result
=end

# First solution
def repeater(string)
  result = ''
  string.chars.each { |char| result << char * 2 }
  result
end

# Second solution
def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

# LS Solution - String#each)char
def repeater(string)
  result = ''
  string.each_char { |char| result << char << char }
  result
end

# Using String#gsub and RegEx
def repeater(string)
  #string.gsub(/(.)/, '\1\1') # OR
  string.gsub(/./) { |match| match + match }
end

# Using Array#zip
def repeater(string)
  string.chars.zip(string.chars).join
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
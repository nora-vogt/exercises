
require 'pry'
=begin
PROBLEM
Input:
  - string

Output:
 - Hash
  - keys are lowercase, uppercase, neither
  - value are counts

Rules:
- Hash will count the # of lowercase, uppercase, and neither characters
- All non-alphabetic characters count as neither
- spaces count as "neither"
- Given an empty string, return a result where all counts are 0

EXAMPLES
'AbCd +Ef'
lowercase: b d f => 3
uppercase: A C E => 3
neither: (whitespace) + => 2

''
lowercase: 0
uppercase: 0
neither: 0

DATA STRUCTURE
start: string
end: result

ALGORITHM
Given a string,
- create an empty result "result"
- count all lowercase letters in string
  - make key lowercase => count in result
- count all uppercase letters in string
  - make key uppercase => count in result
- count all non-alphabetic characters in string, including whitespace
  - get length of string, subtract lowercase and uppercase count
  - make key neither => count in result
- return result
=end

# First Solution
def letter_case_count(string)
  lowercase = string.count('a-z')
  uppercase = string.count('A-Z')
  result = {}
  result[:lowercase] = lowercase
  result[:uppercase] = uppercase
  result[:neither] = string.size - lowercase - uppercase
  result
end

# Second Solution
def lowercase?(char)
  ('a'..'z').to_a.include?(char)
end

def uppercase?(char)
  ('A'..'Z').to_a.include?(char)
end

# Second Solution
# matches LS Solution 1, except I used helper methods instead of constants for uppercase/lowercase
def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |element|
    if lowercase?(element)
      result[:lowercase] += 1
    elsif uppercase?(element)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

# LS Solution
# Similar to my first solution, but breaks string into array of chars, and uses String#=~ to match each char to a regex pattern in the block passed to #count
  # String#=~ returns either the Integer index of first substring that matches the given regex pattern, or nil if no matches
  # Array#count with a block will return the number of elements for which the block returns a truthy value

def letter_case_count(string)
  result = {}
  chars = string.chars
  result[:lowercase] = chars.count { |char| char =~ /[a-z]/ }
  result[:uppercase] = chars.count { |char| char =~ /[A-Z]/ }
  result[:neither] = chars.count { |char| char =~ /[^a-zA-Z]/ }
  p result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
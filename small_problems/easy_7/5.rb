=begin
Input:
- String

Output:
- new string

Write a method that takes a string argument, and returns a new string with letters alternating between upper and lower case. Non-alphabetic characters should not be changed, but DO count as characters for upper/lower case switching order. (AlL_CaPs)

Rules:
- Spaces count as characters
- Non-alphabetic chars count as chars
- Count spaces/non-alpha chars in upper/lower switch order
- Start with uppercase

Qs:
- What should be returned if an empty string is passed?

EXAMPLES:

ignore 77 the 444 numbers
       space  7      7      space
IgNoRe(upper)(lower)(upper)(lower)ThE...
0 1 2 3

evens are uppercase
odds are lowercase
'IgNoRe 77 ThE 444 NuMbErS'

DATA STRUCTURE:
start: string
middle: array
end: string

ALGORITHM:
- Given a string, "string"
- create a new string "result"
- split string into an array of chars, and iterate through array with index
  - if index is an even number
    - push upcased current char to result
  - if index is an odd number
    - push downcasedcased current char to result
- return result
=end

# First Solution
def staggered_case(string)
  result = ''
  string.chars.each_with_index do |char, index|
    if index.even?
      result << char.upcase
    else
      result << char.downcase
    end
  end
  result
end

# Second Solution
def staggered_case(string)
  result = ''
  index = 0
  while index < string.length
    char = index.even? ? string[index].upcase : string[index].downcase
    result << char
    index += 1
  end
  result
end

# LS Solution
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper # swap to opposite boolean value each iteration
  end
  result
end

# Further Exploration
# Modify so caller can request first char be downcased rather than upcased

def staggered_case(string, start_upper: true)
  result = ''
  string.chars.each do |char|
    if start_upper
      result << char.upcase
    else
      result << char.downcase
    end
    start_upper = !start_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"
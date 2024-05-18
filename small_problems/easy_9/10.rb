=begin
Input: integer
Output: sum of digits in integer

Problem: Write a method that takes one integer argument, and returns an integer sum of all the digits in that number.

# Rules:
- For a challenge, don't use while, until, loop, or each in solution

ALGORITHM:
- given an integer "number"
- get all the digits in number
- add digits to an array
- sum the array
=end

# First Solution
def sum(number)
  number.digits.sum
end

# Second Solution
def sum(number)
  number.digits.reduce(:+)
end

# Third Solution - if we didn't know #digits
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# LS Solution 
def sum(number)
  sum = 0
  number.to_s.chars do |string_digit|
    sum += string_digit.to_i
  end
  sum
end



puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Input: integer
Output: next integer (next featured number)

Rules:
- A featured number is:
  - odd AND
  - a multiple of 7 AND
  - each digit occurs exactly once
- return an error message if there is no next featured number
- max number to consider: 9_999_999_999

EXAMPLES:
49 - featured
98 - no (not odd)
97 - no (not a multiple of 7)
133 - no (3 appears twice)

DATA STRUCTURES:
start: integer

array or range of integers

end: integer

ALGORITHM:
given an integer, number
- start a loop (while?)
  - increment number by 1
  - check if number is odd, a multiple of 7, and digits are unique
    - return that number if all parameters are true
- END loop when number >= 9_999_999_999

- return an error message

* odd
* multiple of 7 (num % 7 == 0)
* unique digits
  - split number into an array of digits
  - iterate through array
  - check if count of each number > 1
    - if true: return false
    - if false: return true
=end

# def unique_digits?(number)
#   digits = number.digits
#   digits.none? { |digit| digits.count(digit) > 1 }
# end

# def featured(number)
#   if number >= 9_999_999_999
#     return "There is no possible number that fulfills those requirements"
#   end

#   while number <= 9_999_999_999
#     number += 1
#     return number if number.odd? && number % 7 == 0 && unique_digits?(number)
#   end 
# end

# LS SOLUTION
 # given a number
 # increment number by 1 (otherwise, if number is already odd and a multiple of 7), the following loop won't run)
 # start a loop (until)
  # increment number by 1 until number is both odd and evenly divisible by 7
# start a loop
  # check if number has only unique digits
    # if true: return number
  # increment number by 14 (this gets us the subsequent odd multiple of 7)
  # break if number >= 9_876_543_210
# return the error message

def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

# Refactor
def unique_digits?(number)
  number.digits == number.digits.uniq
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# TIME: 12:40
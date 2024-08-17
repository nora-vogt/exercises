=begin
Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

PROBLEM:
Given a number, determine the next featured number greater than that number. Return an error message if no next featured number.

RULES:
- Featured Number: an odd number, multiple of 7, with no repeating digits
  - each digit occurs once
- no number greater than 9_999_999_999 can be featured, because it will repeat a digit by necessity


EXAMPLES:
49 - featured
98 - not featured (not odd)
97 - not (not a multiple of 7)
133 - not (3 repeated)

DATA STRUCTURES:
Input: Integer

range of multiples of 7 to check from number to 9_999_999_999

Output: Integer (next featured number or error message)

ALGORITHM:
Given a number, 
- CREATE a range of numbers, from 1 greater to 9_876_543_210 (top of range with unique numbers)
   - ITERATE through the range
   - DETERMINE if number is a featured number
    - check if number is a multiple of 7
    - check if number is odd
    - check if number has only unique digits
   - if yes, return the number and stop iterating

- otherwise, return the error message
=end

def unique_digits?(number)
  # digits = number.to_s.chars
  # digits.uniq == digits

  # or: number.digits.uniq == number.digits
  digits = number.digits
  digits.all? { |digit| digits.count(digit) == 1 }
end

def is_featured?(number)
  number.odd? && number % 7 == 0 && unique_digits?(number)
end

def featured1(number)
  ((number + 1)..9_876_543_210).each do |number|
    return number if is_featured?(number)
  end

  "There is no possible number that fulfills those requirements"
end

=begin
  # LS Solution
  # add 1 to the number
  # start a loop
    # add 1 to the number until the number is odd and a multiple of 7
  # start a loop
    # if the number has all unique digits, return the number
    # otherwise, increment number by 14 (gets the next odd multiple of 7)
    # stop itearting if number exceeds 9_876_542_210
# otherwise return the error code
=end

def featured(number)
  number += 1 # this line is needed because if the number is already an odd multiple of 7, the until loop won't run. then, the number may also have unique digits, and the same number could be returned. this happens for 21 and 1029, for example
  number +=1 until number.odd? && number % 7 == 0

  loop do
    digits = number.to_s.chars
    return number if digits.uniq == digits

    number += 14
    break if number > 9_876_542_210
  end

  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# TIME: 10:14
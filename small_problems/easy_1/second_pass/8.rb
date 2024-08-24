=begin
Reverse the Digits in a Number

Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

PROBLEM:
Given an integer, reverse its digits and return the reversed integer.


RULES:
--leading zeros get removed when reversing a number that ends with 0s


reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1


Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

DATA STRUCTURES:
Input: Integer

convert int to string
string to array of chars
new string - add chars in reverse
string to int


Output: Integer, reversed
=end

def reversed_number1(number)
  number.digits.join.to_i
end

def reversed_number2(number)
  reversed_string_num = ''

  number.to_s.each_char { |digit| reversed_string_num.prepend(digit) }

  reversed_string_num.to_i
end

# Convert the number to a string
# Reverse the string
# Convert the string back to an integer

def reversed_number(number)
  number.to_s.reverse.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
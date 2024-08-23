=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.
PROBLEM:
Given a positive integer, return a string of that length containing alternating 1s and 0s.

RULES:
- string should always start with 1
- int will be positive

Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

The tests above should print true.

DATA STRUCTURES:
Input: Integer

empty string

Output: String

ALGORITHM:
Given an integer, representing length of output string

- SET index to 0
- SET result_string to an empty string
- LOOP while index < number
    IF index is even, PUSH 1 to result string
    IF index is odd, PUSH 0 to result string
    increment index by 1
  END

RETURN result string
=end

def stringy1(length)
  index = 0
  result_string = ''

  while index < length
    result_string << '1' if index.even?
    result_string << '0' if index.odd?
    index += 1
  end

  result_string
end

def stringy(length)
  result_string = ''

  length.times do |index|
    number = index.even? ? '1' : '0'
    result_string << number
  end

  result_string
end

=begin
Further Exploration

Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.


ALGORITHM:
Given a length of string int and optional start number (0 or 1)
- BUILD the result string
  - CHECK if start number is 0 or 1
    - IF 0, start the string with 0
      - numbers at even indices will be 0, numbers at odd indices will be 1
    - IF 1, start the string with 1
      - numbers at even indices will be 1, numbers at odd incides will be 0
- RETURN result string
=end


def stringy(length, start_number=1)
  result_string = ''

  length.times do |index|
    if start_number == 0
      number = index.even? ? '0' : '1'
    else
      number = index.even? ? '1' : '0'
    end
    
    result_string << number
  end

  result_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(6, 0) == '010101'
puts stringy(9, 1) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(2, 0) == '01'
puts stringy(1) == '1'
puts stringy(1, 0) == '0'
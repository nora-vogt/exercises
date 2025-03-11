require 'pry'
=begin
Write some code that converts modern decimal numbers into their Roman number equivalents.

RULES:
- 3000 is largest number we need to be able to convert
- Roman numerals are written by: Expressing each digit separately, starting with the left-most digit.
  Skip any digit with a value of zero

- placing a smaller number in front of a larger number means subtraction

EXAMPLES:
thousands: M 
hundreds: C D M
tens: X L C
ones: I V X

1-3000: multiply number of Ms by first digit
100-900: 

[C D M], [X L C], [I V X]
1-3: 3 of first digit
4: first + second digit
5: second digit
6-8: second digit + increasing number of first digit
9: first digit + third digit

0 ones => [I V X]
1 tens => [X L C]
2 hundreds => [C D M]
3 thousands => [M]

[2000, 800, 30, 9]
2000

base values - conversion hash
1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1

find largest base
number: 2839 - 1000
number: 839 - 500

DATA STRUCTURES:
start: integer

conversion hash (keys are integers, values are corresponding roman numeral)

end: string of roman numerals

ALGO
# initialize - takes an integer
- set @number to integer

# to_roman
- set roman_string = ''
- set number_decimal = @number

loop while current number > 0
- find the largest key in DECIMAL_TO_ROMAN that can be divided into current number
    - select k/v pairs in DECIMAL_TO_ROMAN where key is less than equal to current number (#select)
    - select the pair with largest key (#max)
  - assign key to largest_divisor, value to numeral
- divide the current number by the largest_divisor
  - assign quotient to multiplier, remainder to remainder
- multiply numeral string by multiplier, push to roman_numeral string
- reassign current number to remainder
=end


class RomanNumeral
  attr_reader :number

  DECIMAL_TO_ROMAN = { 
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 
    100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 
    10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 
    1 => 'I'
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    working_number = number

    while working_number > 0
      largest_divisor, numeral = DECIMAL_TO_ROMAN.select do |decimal, _| 
        decimal <= working_number
      end.max
      multiplier, remainder = working_number.divmod(largest_divisor)
      roman_numeral << (numeral * multiplier)
      working_number = remainder
    end
    roman_numeral
  end
end
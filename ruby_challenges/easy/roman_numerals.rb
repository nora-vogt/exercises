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
- set number_to_convert = @number

loop while number_to_convert > 0
  - determine the biggest divisor and associated roman numeral
    - select k/v pairs in DECIMAL_TO_ROMAN where key is less than equal to number_to_convert (#select)
    - select the pair with largest key (#max)
    - assign key to biggest_divisor, value to numeral
  - calculate quotient and remainder of dividing that number - [Q, R]
  - numeral * quotient, add to result string
  - set number_to_convert to remainder

=end


class RomanNumeral
  DECIMAL_TO_ROMAN = { 
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 
    100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 
    10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 
    1 => 'I'
  }

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    to_convert = @number

    while to_convert > 0 # works with DECIMAL_TO_ROMAN in any order
      biggest_divisor, numeral = largest_base_pair(to_convert)
      quotient, remainder = to_convert.divmod(biggest_divisor)
      roman_numeral << (numeral * quotient)
      to_convert = remainder
    end
    roman_numeral
  end

  private

  def largest_base_pair(to_convert)
    DECIMAL_TO_ROMAN.select do |key, value| 
      key <= to_convert
    end.max
  end
end
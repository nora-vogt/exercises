require 'pry'
=begin
Write some code that converts modern decimal numbers into their Roman number equivalents.

RULES:
- 3000 is largest number we need to be able to convert
- Roman numerals are written by: Expressing each digit separately, starting with the left-most digit.
  Skip any digit with a value of zero

- placing a smaller number in front of a larger number means subtraction

1-3 => I
4 => IV
5 => V
6-8 => VI, VII, VIII
9 => IX
10 => X

EXAMPLES:
 1  => I
10  => X
 7  => VII

1990 => MCMXC
1000=M
900=CM
90=XC

2008 => MMVIII
2000=MM
8=VIII

LOOKING FOR PATERN - UP TO 3000:

1-10
I V X

2000 - MM
800 - (hash[tens][1]) + (hash[tens] * (8-5)) +    DCCC
30 -        XXX
9 -         IX

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
number: 2839
number: 839

DATA STRUCTURES:
- conversion hash:





ALGO
# initialize - takes an integer
- set @number to integer

# to_roman
- set roman_string = ''
- set remainder = @number

loop while remainder > 0
  - get largest base number in conversion hash
    - iterate through hash conversion values keys - #find
      - select the first value that is less than or equal to current remainder
  - get roman numeral associated with that key in hash, set to current_numeral
  - calculate quotient and remainder of dividing that number - [Q, R]
  - numeral * quotient, add to result string
  - set remainder to R

=end


class RomanNumeral
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
    remainder = @number

    while remainder > 0
      biggest_divisor = DECIMAL_TO_ROMAN.keys.find { |n| n <= remainder }
      current_numeral = DECIMAL_TO_ROMAN[biggest_divisor]
      quotient, remainder = remainder.divmod(biggest_divisor)
      roman_numeral << (current_numeral * quotient)
    end
    roman_numeral
  end
end



# 2839 => MMDCCCXXXIX
# RomanNumeral.new(2839).to_roman == 'MMDCCCXXXIX'
RomanNumeral.new(1).to_roman == 'I'
# RomanNumeral.new(4).to_roman == 'IV'


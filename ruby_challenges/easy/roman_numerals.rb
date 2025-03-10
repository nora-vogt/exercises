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

DATA STRUCTURES:

roman numeral hash:
I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000

DECIMAL_TO_ROMAN = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
BRAINSTORM:

1990 => MCMXC
1000 M
900 CM
90 XC
0 -

2839 => MMDCCCXXXIX
break into units - %
2839
2000 - MM
800 - DCCC
30 - XXX
9 - IX

1003 => MIII
1000
000 skip
00 skip
3

check length of number?
if 4 digits
- check leading digit (1, 2, 3)
- concatenate that many 'M's

elsif 3
- check leading digit (0-9)
d => 500

 - if 900: CM
 - if 800: DCCC
 - if 700: DCC
 - if 600: DC
 - if 500: D
 - if 400: CD

 if 1-3, 6-8: C * num
 - if 300: CCC
 - if 200: CC
 - if 100: C

elsif 2
  - 90: XC
  - 80: LXXX
  - 70: LXX
  - 60: LX
  - 50: L
  - 40: XL
  - 30: XXX
  - 20: XX
  - 10: X

20 => 'XX', 30 => 'XXX', 40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC'

else (1 digit)

ALGO
# initialize

# to_roman

# expand
  # iterate through array of chars in string, with index
  # create new string slice, get char at current index, replace subsequent chars with zero
  # add string to array
=end


class RomanNumeral
  DECIMAL_TO_ROMAN = { 
    1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV',
    5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX',
    10 => 'X', 20 => 'XX', 30 => 'XXX', 40 => 'XL', 
    50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC', 100 => 'C',
    200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC', 
    700 => 'DCC', 800 => 'DCCC', 900 => 'CM', 1000 => 'M'}

  def initialize(number)
    @number = number
  end

  def to_roman
    expanded_number = expand
    roman = ''
    expanded_number.each do |place_value|
      first_digit = place_value[0].to_i
      if place_value.size == 4
        roman << ('M' * first_digit)
      elsif
        roman << DECIMAL_TO_ROMAN[place_value.to_i]
      end
    end
    roman
  end

  def expand
    result = []
    number_string = @number.to_s
    0.upto(number_string.size - 1) do |index|
      next if number_string[index] == '0'
      result << number_string[index] + ('0' * (number_string.size - index - 1))
    end
    result
  end
end



# 2839 => MMDCCCXXXIX
# RomanNumerals.new(2839).to_roman

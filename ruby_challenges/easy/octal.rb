require 'pry'
=begin
# PROBLEM: Implement an octal to decimal conversion. The method should take an input  string (the octal number) and produce an integer output.

Octal:
- base 8 - only uses numbers 0-7

Rules:
- treat invalid input as octal 0
  - invalid is an octal string that contains a char that is not 0-7
- don't use any built-in conversions
- input string may be any length
- input string may contain letters or numbers
- octal 0 is decimal 0

CONVERT OCTAL TO DECIMAL:
- multiply last digit by 8^0
- multiply next digit by 8^1
- continue pattern, increasing the power by 1 each time
- sum all resulting values

# EXAMPLES
'carrot' -> 0 (invalid)
'8' -> 0 (invalid)

233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

- check that octal string only contains 0-7 digits

# DATA STRUCTURES
input: octal string
- array of digits

output: integer

# ALGORITHM
initialize - takes a string argument
-assign string to @octal

instance methods:
  # to_decimal
  - return 0 unless @octal is #valid?
  - convert @octal string to integer
  - set decimal to 0
  - split integer into an array of digits - #digits reverses order - perfect!
    - iterate through the array of digits, with index
      - for each digit, multiply: digit * 8**index
      - add the result to decimal

private instance methods:
  # valid?
  - create an array of strings 0-7
  - check if each character in @octal is included in array
  - return false if no, true if yes
=end

class Octal
  def initialize(string)
    @octal = string
  end

  def to_decimal
    return 0 unless valid?
    sum = 0
    @octal.to_i.digits.each_with_index do |digit, exponent|
      sum += (digit * (8 ** exponent))
    end
    sum
  end

  private

  def valid?
    octal_numbers = ('0'..'7').to_a
    @octal.chars.all? { |digit| octal_numbers.include?(digit) }
    # @octal.chars.all? { |digit| digit =~ /[0-7]/ } # LS Solution
  end
end

=begin
# LS Solution
Basically the same - except:
  - calls method valid_octal? and explicitly passes number (the getter for @number) as an argument. Since the octal string is already saved as @number, and #to_decimal is an instance method, I don't think we actually need to explicilty pass number like this.
  - Valid number check - use String#=~  num.chars.all? {|n| n =~ /[0-7]/}
  - Renamed the block parameter "index" on line 69 to "exponent" for clarity
=end
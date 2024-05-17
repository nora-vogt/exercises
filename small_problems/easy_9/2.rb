=begin

Input: integer
Output: integer (2x the input unless double number)

Rules:
- double numbers have even number of digits
- double numbers are when left-side digits match right-side digits (ex: 4646, 44, 103103)
- if input is a double number, return that number
- if input is not a double number, return 2x the input
- a single digit is not a double number

EXAMPLES:
4444 -> [4 4 4 4]
- check if even number of digits
  - if no, return false
- if yes:
  - length = 4 / 2 = 2 (center)
  - first center == last center

ALGORITHM:
given a number, "number"
- determine if number is a double number
  - if yes, return that number
  - if no, return number * 2

** determine double number**
- given a number, "number"
- get array of digits in number (digits)
- check if the number of digits in number is even
  - if no: return false
  - if yes:
    - divide digits.length / 2, assign to "center"
    - compare digits[0, center] to digits[center, -1]
      - if equal, return true
      - otherwise return false
=end

# def double_number?(number)
#   digits = number.digits.reverse
#   if digits.size.even?
#     center = digits.size / 2
#     digits[0, center] == digits[center..-1] ? true : false
#   else
#     false
#   end
# end

# # refactor
# def double_number?(number)
#   digits = number.digits.reverse
#   center = digits.size / 2
#   # digits.size.even? catches edge-case of single-digit numbers
#   if digits.size.even? && digits[0..center - 1] == digits[center..-1]
#     true
#   else
#     false
#   end
# end

# def twice(number)
#   double_number?(number) ? number : number * 2
# end

# Refactor again to catch edge-case of single-digit numbers
   # make left-side slice an exclusive range

def twice(number)
  digits = number.digits.reverse
  center = digits.size / 2
  digits[0...center] == digits[center..-1] ? number : number * 2
end


# # LS Solution
# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   # ternary statement catches edge-case of single-digit numbers
#   left_side = center.zero? ? '' : string_number[0..center - 1]
#   right_side = string_number[center..-1]

#   left_side == right_side ? number : number * 2
# end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
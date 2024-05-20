=begin
PROBLEM:
Write a method that rotates the last N digits of a number. Method will have two arguments: first_digits is the integer to rotate, last_digits is the number of digits to rotate.

Input:
- integer (number to rotate)
- integer (number of digits)

Output:
- integer (rotated)

Rules:
- use the rotate_array method from previous exercise
- rotating 1 digits returns the original number
- rotate from the end of the number
- n is always a positive integer

EXAMPLES
735291, 3
735  291
735 912

735291, 5 == 752913
fifth digit from end = 3
752913

whatever # of digits is given, the integer at that position counting from left moves to the end of the number
735291, 1
73529 1 (1 is in 1st position, "moves" to end (# stays the same))
== 735291

735291, 4
73 5291 (5 is in 4th position from end, moves to end)
== 732915

rotate_array moves first_digits digit to end 
we want to move integer at -digit index position to end (-index counting from end)

ALGORITHM,
given an integer "integer" and an integer "number_of_digits"
- break integer into an array of digits, set to "digits"
- get two slices of digits:
  - first_digits slice: "first_digits"
    - from [0, digits.size - number_of_digits]
    - this is what's leftover at beginning of array

  - last_digits slice: "last_digits"
    - start_index for slice is -number_of_digits
    - end index for slice is -1
- pass "last_digits" slice into rotate_array
- concatenate "first_digits" slice with return value of rotate_array
  - join returned array into string
  - convert string to integer
  - return that integer
=end


def rotate_array(array)
  array[1..-1] + [array[0]]
  # array[1..-1] << array[0] # alternative
end

# def rotate_rightmost_digits(integer, number_of_digits)
#   digits = integer.to_s.chars
#   first_digits = digits[0, digits.size - number_of_digits]
#   last_digits = digits[-number_of_digits..-1]
#   (first_digits + rotate_array(last_digits)).join.to_i
# end

# LS Solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # this line returns the rotated array, which is then assigned using Array#[]= at the indicated index positions -n..-1 aka: the last n digits
  all_digits.join.to_i
end

# Using Array#rotate
# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = all_digits[-n..-1].rotate
#   all_digits.join.to_i
# end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
# TIME: 22mins

# NOTES:
# all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
# all_digits[-1..-1] = means "replace the last n elements with the values to the right of the equals sign"
  # this is Array#[]=


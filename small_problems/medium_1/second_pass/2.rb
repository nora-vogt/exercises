=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

PROBLEM: Create a method that can rotate the rightmost n digits of a number. The digit specified by n (counting from the right) will be moved to the end of the array.

RULES:
- if given an integer of 1, the same number is returned
- count from the right
- digit specified by n moves to right

EXAMPLES:
735291, 2 == 735219
the last two digits swap

735291, 3 == 735912

735291, 6) == 352917
7 35291
352917

DATA STRUCTURES:
start: two integers (number to rotate, last n digits)

integer -> string
array of chars in string
  - subarray slice, last n digits -> rotate
  - subarray slice, remainder of preceeding digits

end: rotated integer

ALGORITHM:
Given a integer, and a number of digits (n)
- create an array of all digits in the number - 'all_digits'
  - convert the integer to a string
  - split the string into an array of chars
- get a slice of all_digits, excluding the last n digits
  - all_digits[0...-n]
- get a slice of all_digits containing only last n digits
  - all_digits[-n..-1]
- rotate the last digits slice
- concatenate first digits with rotated last digits
- join array into a string
- convert to integer

* rotate array helper method*
Given an array,
  - get slice of array from 1..-1
  - concatenate slice containing element at index 0

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits1(number, digits)
  array_of_digits = number.to_s.chars

  first = array_of_digits[0, (array_of_digits.size - digits)]
  second = array_of_digits.last(digits)

  (first + rotate_array(second)).join.to_i
end

# Refactor
def rotate_rightmost_digits2(number, n)
  all_digits = number.to_s.chars

  first_digits = all_digits[0...-n]
  last_digits = all_digits[-n..-1]

  (first_digits + rotate_array(last_digits)).join.to_i
end

=begin
# LS SOLUTION
- set "all_digits" to an array of digits in integer
  - convert integer to string
  - split string into an array of chars

- reassign the last n digits of all_digits to the rotated array
  - get a slice of all_digits from [-n..-1]
  - pass the slice into rotate_array helper method
  - use the returned rotated array for reassignment

- join all_digits into a string
- convert the string to integer
=end

def rotate_rightmost_digits4(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
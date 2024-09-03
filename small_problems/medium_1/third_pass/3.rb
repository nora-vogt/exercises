=begin
Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Challenge: making from scratch, not using rotate_rightmost_digits

RULES:
- Max rotation: rotate number to the left. On subsequent iterations, fix the first n numbers, where n is the number of previous iterations.
- # of rotations will be 1 less than # of digits in input

Example:
max_rotation(735291) == 321579
rotations: 0
735291 => 352917

rotations:1; fix first digit
352917 => 329175

rotations:2
329175 => 321759

rotations: 3
321759 => 321597

rotations: 4
321597 => 321579

final: 321579

max_rotation(3) == 3 - only 1 digit, 0 rotations
max_rotation(35) == 53 - 2 digits, 1 rotation
max_rotation(105) == 15 # the leading zero gets dropped
105 => 051 (leading 0 gets dropped)
51 => 15

max_rotation(8_703_529_146) == 7_321_609_845

DATA STRUCTURES:
Input: integer

array of digits in current number

Output: maximally rotated integer

BRAINSTORM:
- need a way to know when to stop rotating
  # of rotations is 1 less than # of digits in input
- need a way to fix first n digits

array of current digits
digits - reassign
number_of_rotations = length of all digits - 1

105 => 15
[1, 0, 5]

rotate first digit - move to end
[0, 5, 1]

join to string: "051"
convert to int: 51 - reassign to digits
repeat

ALGORITHM:
Given an integer, number
- SET digits to input number
- DETERMINE number of rotations
  - get length of digits, subtract 1 - set to number_of_rotations

- ITERATE number_of_rotations times, rotating array each time
  - GET the number to rotate - starting at 0 
    - CREATE a slice from fixed_digits to end of number
    - SET fixed to a subarray from 0 to starting_index

  - ROTATE the subarray * helper
      - create an array of digits in digits
      - get slice of array from 1 to -1
      - get slice of array from 0, 1 digit in length
      - concatenate both arrays togther
      - return array
  - concatenate fixed + rotated subarray
  - reassign digits to result
- RETURN digits
=end

def rotate_array(digits)
  digits[1..-1] + digits[0, 1]
end

def max_rotation(number)
  rotated_number = number.digits.reverse
  number_of_rotations = number.to_s.length - 1

  number_of_rotations.times do |index|
    fixed = rotated_number[0...index]
    subarray = rotated_number[index..-1]
    # digits = fixed + rotate_array(subarray)
    rotated_number = fixed + rotate_array(subarray)
  end

  rotated_number.join.to_i
end

# p rotate_array([1, 0]) == [0, 1]
# p rotate_array([1, 2, 3]) == [2, 3, 1]

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# TIME: 33:08
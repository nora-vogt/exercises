=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

PROBLEM: Write a method that returns the maximum rotation of the given number.

RULES:
- with each rotation, keep the first x number of digits in place
  - x starts at 0, increments each time
- the number of rotations performed will be 1 less than size of number
- any leading zero will be dropped
- do not have to handle multiple zeroes
- given a 1-digit number, returned number will be the same

EXAMPLES:
735291
first rot: 735291 => 352917
second: 3 52917 => 329175
third: 32 9175 => 321759
fourth: 321 759 => 321597
fifth: 3215 97 => 321579
sixth: 32159 7 => 321597

6-digit number has 6 rotations, but the last one doesn't actually move the number

105
first: 105 => 051
second: (zero gets dropped) 5 1 => 15

DATA STRUCTURES:
Given a number,
- determine the number of rotations to achieve max rotations
  - convert number to a string
  - get size of string and subtract one
  - set "number_of_digits" to result

*using rotate_rightmost_digits helper method*
- loop to rotate all digits of a number - while number_of_digits is greater than 0
  - rotate_rightmost_digits(number, number_of_digits)
  - reassign number to this result
  - decrement number_of_digits by 1

- return the new number

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation1(number)
  number_of_digits = number.to_s.size

  while number_of_digits > 0
    number = rotate_rightmost_digits(number, number_of_digits)
    number_of_digits -= 1
  end

  number
end

=begin
LS Solution
- given a number
- determine the last number of digits to rotate - number_digits
  - convert number to a string, get the size of the string
- iterate from number_digits down to 2
  - this is inclusive, will include 2
  - won't include rotating the last 1 digit, because it won't change the number.
  - reassign number to the result of rotating the last number_digits

- return the number

This is the same approach as my solution, just using a different mechanism to iterate - Integer#upto instead of a while loop.
  - my solution currently rotates all the rightmost digits, even when there is only 1 to the right. This is okay, doesn't change the number. just redundant. Could change by altering condition of while loop: while number_of_digits > 1
  - LS Solution demonstrates: last rotation needed is when there are 2 unrotated digits left to the right
=end

def max_rotation(number)
  number_digits = number.to_s.size

  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end

  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# TIME: 16:00
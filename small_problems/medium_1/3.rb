=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

PROBLEM: WRite a method that takes an integer as an argumet, and returns the maximum rotation of that integer. 

Input: Integer
Output: Integer, maximally rotated

Rules:
- use prior rotate_rightmost_digits method
- do not have to handle multiple zeroes
- leading zeroes get dropped

EXAMPLES:
maximum rotation
start: 735291
don't fix any digits, rotate left: 352917
fix first digit, rotate rest left: 329175
fix first two digits, rotate rest left: 321759
fix first three digits, rotate rest left: 321597
fix first four digits, rotate rest in place: 321579

6 digit number has 5 iterations of rotation
735291 => 321579

fix 0, 1, 2, 3, 4

DATA STRUCTURE:
start: integer
middle:
array of all digits in integer
n = 6
[7 3 5 2 9 1]   -> rotate first       -> [3 5 2 9 1 7]

n = 5
fix 1 [3]       -> rotate [5 2 9 1 7] -> [3 2 9 1 7 5]

n = 4
fix 2 [3 2]     -> rotate [9 1 7 5]   -> [3 2 1 7 5 9]

n = 3
fix 3 [3 2 1]   -> rotate [7 5 9]     -> [3 2 1 5 9 7]

n = 2
fix 4 [3 2 1 5] -> rotate [9 7]       -> [3 2 1 5 7 9]

end: integer
321579


105
n = 3
[1 0 5] -> rotate first -> [0 5 1]

n = 2
fix 1 [0] -> rotate [5 1] -> [1 5] -> [0 1 5]
leading 0 gets dropped when converting integer to string
15

ALGORITHM:
Given an integer, "number"
- SET number_of_digits equal to size of array of all digts in number as a string
- start a loop
  - invoke rotate_rightmost_digits(number, number_of_digits)
  - reassign number to the return value
  - decrement number_of_digits by 1
  - stop looping when number_of_digits == 1
- join digits in number into a string
- convert string to integer
- return the integer

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # this line returns the rotated array, which is then assigned using Array#[]= at the indicated index positions -n..-1 aka: the last n digits
  all_digits.join.to_i
end

def max_rotation(number)
  number_of_digits = number.to_s.size
  loop do
    break if number_of_digits == 1
    number = rotate_rightmost_digits(number, number_of_digits)
    number_of_digits -= 1
  end
  number
end

# LS Solution
# Similar approach to mine. In my solution, the loop stops when number_of_digits < 2. The same functionality here is through using #downto(2). For Example with the first number, this iterates, (6..2)
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

# Further Exploration


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# TIME: 22:33
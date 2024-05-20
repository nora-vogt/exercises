=begin
PROBLEM
Write a method that rotates an array by movign the first element to the end of the array. Do not mutate the argument array.

Input: array
Output: new array, rotated

Rules:
- array may contain letters or integers
- do not mutate original array
- a 1-element array should return a new 1-element array
- move 1st value in array to very end of array

DATA STRUCTURE & EXAMPLES:
start: array
['a', 'b', 'c']

middle: copy of original array
['a', 'b', 'c']

end: rotated new array
['b', 'c', 'a']

ALGORITHM:
given an array, "array"
- SET rotated_array to a copy of array
- remove first element from rotated_array, SET to first_element
- add first_element to end of rotated array
- return rotated array
=end

# Solution 1
# def rotate_array(array)
#   rotated_array = array.dup
#   first_element = rotated_array.shift
#   rotated_array << first_element
# end

# Alternative - also refactoring of my solution
  # can #shift and #<< on the same line
# def rotate_array(array)
#   rotated_array = Array.new(array)
#   rotated_array << rotated_array.shift
# end

# LS Solution
# Use Array#[] to return a new array containing all but the first element from original array.
# Use Array#[] (array concatenation) to concatenate first element from aray to end of new array
  # note - first element must be in an array to concatenate
  
def rotate_array(array)
  array[1..-1] + [array[0]]
  # array[1..-1] << array[0] # alternative
end

# Further Exploration
# Rotate a string
# Rotate an integer
# use rotate_array in solution

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  #rotate_array(integer.to_s.chars).join.to_i
  rotate_string(integer.to_s).to_i
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_string('hello') == 'elloh'
p rotate_string('a') == 'a'
p rotate_integer(12345) == 23451
p rotate_integer(0) == 0

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

y = 'jello'
p rotate_string(y) == 'elloj'
p y == 'jello'

# TIME: 5:22
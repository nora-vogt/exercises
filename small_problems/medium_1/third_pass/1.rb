=begin
Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

RULES:
- do not use array#rotate or rotate!
- move first element of array to end of array

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

DATA STRUCTURES:
Input: array of elements

new array

Output: new array - rotated

ALGORITHM:
Given an array of elements, array
- CREATE a slice of input array, from element 1 to end of array
- CREATE a slice of input array, first element only
- CONCATENATE two slices together, return the resulting array
=end

def rotate_array(array)
  array[1..-1] + array[0, 1]
end

def rotate_array2(array)
  array = array.dup
  array << array.shift
  array
end

# Further Exploration
# rotate string, then rotate integer. use same method.

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_string('hello') == 'elloh'
p rotate_string('x') == 'x'
p rotate_integer(1234) == 2341
p rotate_integer(1) == 1

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
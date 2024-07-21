=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

PROBLEM: Create a copy of the input array. Move the first element to the end of the array.

Input: Array of elements
Output: new array

RULES:
- if given a single-element array, return a new array containing that element

DATA STRUCTURES:
start: array

intermediate: new array

end: array

ALGORITHM:
- Given an array
- Create a copy of the Array
- Move the first element to the end of the array
  - destructively remove first element from the array
  - add it to the end of the array
- return the new array
=end

def rotate_array1(array)
  new_arr = array.dup
  first_element = new_arr.shift
  new_arr << first_element
end
#TIME: 4:02

#Refactor
def rotate_array(array)
  array[1..-1] << array[0]
end

=begin
ALG 2
- get a slice of array from index 1 to -1
- get a slice of array at index 0
- concatenate both slices
- return the new array
=end

def rotate_array2(array)
  array[1..-1] + [array[0]]
  #array[1..-1] + array[0, 1]
  #array[1..-1] << array[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

#TIME: 4:02

=begin
Further Exploration

Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.
ROTATE STRING - ALG:
- split the string into an array of characters
- rotate the array *helper method
- join the new array back into a string

full algorithm, no helpers:
Given a string,
- split the string into an array of characters
- get a slice of the array from index 1 to -1
- concatenate a slice of the array at index 0
- join the new array back into a string

ROTATE INTEGER - ALG:
- convert the integer to a string
- rotate the string * helper method
- convert the string back into an integer

full algorithm, no helpers:
- Given an integer
- Convert the integer to a string
- Split the string into an array of chars
- Get a slice from the array at index 1 to -1
- Concatenate another slice from the array at index 0
- Join the array into a string
- Convert the string to an integer
=end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

p rotate_string('hello') == 'elloh'
p rotate_string('good morning') == 'ood morningg'
p rotate_integer(1234) == 2341
p rotate_integer(2_444_444) == 4_444_442

# Total time - everything: 15:34
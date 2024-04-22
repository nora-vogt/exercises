=begin
PROBLEM
Input:
- array one
- array two

Output:
- new array

Rules:
- both given arrays will be non-empty
- both given arrays will have the same number of elements

Write a method that takes two Array arguments, and returns a new array. The new array should contain all elements from both given arrays in alternating order. ex: [arr1, arr2, arr1, arr2, arr1]

EXAMPLES
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

DATA STRUCTURE
start: two arrays
middle: array
end: array

ALGORITHM
Given two arrays, array1 and array2
- create a new empty array "result"
- create "index" assign to 0
- start a loop
  - add element at index from array1 to result
  - add element at index from array2 to result
  - increment index by 1
  - stop looping when index == array1.size
- return result
=end

# first solution
def interleave(array1, array2)
  result = []
  index = 0
  while index < array1.size
    result << array1[index] << array2[index]
    index += 1
  end
  result
end

# second solution
def interleave(array1, array2)
  array1.map.with_index do |element, index|
    [element, array2[index]]
  end.flatten
end

# third solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# Further Exploration
# Use #zip + one other method
def interleave(array1, array2)
  array1.zip(array2).flatten(1)
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([[1], [2]], [3, 4]) == [[1], 3, [2], 4]
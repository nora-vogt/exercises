=begin
Problem: Write a method that takes an array argument. Return a new array that contains every other element from the argument array. The values returned should be the 1st, 3rd, 5th... etc elements in the array.

Input: array
Output: new array

Rules:
- new array should contain every-other element, starting from the 1st element
  - only the odd number elements
- array may contain integers or strings
- given an empty array, return an empty array
- given a 1-element array, return a 1-element array

Qs for interviewer:
- should a new array or original arg array be returned?

EXAMPLES:
[2, 3, 4, 5, 6]
[2, 4, 6]

1st element -> index 0
3rd element -> index 2
5th element -> index 4
etc.. even indices

DATA STRUCTURE: array

ALGORITHM:
Given an array, "array"
- SET result to new array
- iterate through given array, with index
  - if index is even, add the current element to new array
  - if index is odd, continue iterating
- return result array
=end

# # Solution 1
# def oddities(array)
#   result = []
#   array.each_with_index do |element, index|
#     result << element if index.even?
#   end
#   result
# end

# # Solution 1.5 - an alternative
# def oddities(array)
#   result = []
#   array.each_with_index do |element, index|
#     next if index.odd?
#     result << element
#   end
#   result
# end

# # Solution 2
# def oddities(array)
#   array.select.with_index { |element, index| index.even? }
# end

# # Solution 3 - use a loop
# def oddities(array)
#   result = []
#   index = 0
#   while index < array.size
#     result << array[index] if index.even?
#     index += 1
#   end
#   result
# end

# # LS Solution - refactored version of Solution 3
# def oddities(array)
#   odd_elements = []
#   index = 0
#   while index < array.size
#     odd_elements << array[index]
#     index += 2
#   end
#   odd_elements
# end

# Using #each_index
def oddities(array)
  array.each_index.with_object([]) do |index, result|
    result << array[index] if index.even?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
=begin
Input:
  - two arrays (containing integers)

Output: 
  - new array

Rules:
- new array should contain product of both elements at each index from argument arrays
- the given arrays contain the same number of elements

Qs:
- will arrays always contain integers?

DATA STRUCTURE:
start: two arrays
middle: array
end: array

EXAMPLES:
[3, 5, 7], [9, 10, 11]
3 * 9 = 27
5 * 10 = 50
7 * 11 = 77
[27, 50, 77]

ALGORITHM:
- Given two arrays, numbers1 and numbers2
- create "result" empty array
- iterate through numbers1, with index
  - multiply current num * numbers2[index], push to result
- return result
=end

# First Solution
def multiply_list(numbers1, numbers2)
  result = []
  numbers1.each_with_index { |num, index| result << num * numbers2[index] }
  result
end

# # Second Solution
def multiply_list(numbers1, numbers2)
  numbers1.each_with_object([]).with_index do |(number, array), index|
    array << number * numbers2[index]
  end
end

# Further Exploration
# Use 1-line #zip solution
def multiply_list(list_1, list_2)
  list_1.zip(list_2).map { |array| array.inject(:*) }
end

# Not 1-line, but alternate use of #zip
def multiply_list(list_1, list_2)
  result = []
  list_1.zip(list_2).map { |num1, num2| result << num1 * num2 }
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
require 'pry'
=begin
Input:
- two arrays containing numbers

Output:
- new array, containing product of every possible pair of numbers formed from two arrays

Rules:
- sort result array by increasing value (lowest first)
- neither given array is empty
- result array should contain integers
- product is result of multiplying two numbers
- "all pairs" means multiple each number from array1 with each number from array2
- include duplicate products

EXAMPLES:
[2, 4], [4, 3, 1, 2]
2 * 4 = 8
2 * 3 = 6
2 * 1 = 2
2 * 2 = 4
4 * 4 = 16
4 * 3 = 12
4 * 1 = 4
4 * 2 = 8

2 4 4 6 8 8 12 16
2, 4, 4, 6, 8, 8, 12, 16

DATA STRUCTURE:
start: two arrays
middle: one array
end: array

ALGORITHM:
given two arrays of integers,
- create products, assign to empty array
- iterate through the first array
  - iterate through second array
    - multiply current number from first array with current number from second array
    - add the result to product
- sort product in ascending order
- return product
=end

# first solution - same a LS solution
def multiply_all_pairs(numbers1, numbers2)
  products = []
  numbers1.each do |first_num|
    numbers2.each do |second_num|
      product << first_num * second_num
    end
  end
  products.sort
end

# second solution
def multiply_all_pairs(numbers1, numbers2)
  numbers1.product(numbers2).map { |sub_arr| sub_arr.reduce(&:*) }.sort
end

# LS alternate solution
  # can use two block params with #map - will be each element of the current 2-element sub array
def multiply_all_pairs(numbers1, numbers2)
  numbers1.product(numbers2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


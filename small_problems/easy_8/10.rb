=begin
Problem: Write a method that takes an array containing integers. Return the average of all numbers within the array.

Input: array of integers
output: integer (average)

Rules:
- the given array will never be empty
- the integers will always be positive
- Don't use Array#sum in the solution

ALGORITHM:
- create "sum" set to 0
- iterate through the array
  - add each integer to "sum"
- divide sum by array.length
- return that integer
=end

# Solution 1 - using Enumerable#reduce
def average(numbers)
  numbers.reduce { |sum, num| sum + num } / numbers.size
end

# Solution refactor
def average(numbers)
  numbers.reduce(:+) / numbers.count
end

# Solution 2 - using #each
def average(numbers)
  sum = 0
  numbers.each { |number| sum += number }
  sum / numbers.size
end

# Further Exploration - change return value to a Float
# Using Integer#fdiv - returns the Float result of division
def average(numbers)
  p numbers.reduce(:+).fdiv(numbers.count)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
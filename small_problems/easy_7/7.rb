=begin
Input: array of integers
Output: Float (rounded to 3 decimal places)

Rules:
- multiply all integers in array, then divide by number of elements in the array
- output should be printed, rounded to 3 decimal places
- array will be non-empty
- if array has one integer, show that integer as a float with 3 decimal places (ex: [6] => 6.000)

DATA STRUCTURE:
start: array
middle: float
end: rounded float

EXAMPLES:
show_multiplicative_average([3, 5])  
3 * 5 = 15
15 / 2.0 = 7.5 -> 7.500

show_multiplicative_average([6]) 
)
6
6 / 1.0 = 6 -> 6.000

[2, 5, 7, 11, 13, 17]

2 * 5 * 7 * 11 * 13 * 17 = 170170
170170 / 6.0 = 28361.667

ALGORITHM:
Given an array of integers, "array"
- get the product of multiplying all integers in array together
- convert product to float
- divide product by number of elements in the array
  - round answer to three decimal places
- output the result interpolated in specified string
=end

# First Solution
def show_multiplicative_average(array)
  average = (array.inject(:*).to_f / array.size)
  puts "The result is #{format('%.3f', average)}"
end

# NOTES:
# Could also use #fdiv on the Integer result of #inject, which performs float division. Wouldn't need the #to_f

# LS Solution
def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

# Further Exploration
# If #to_f is omitted on the first line of the method, the average will be calculated using Integer division, which truncates the result to just the integer, rather than Float division which returns the full result including decimal places. Formatting the average will add three zeroes after the decimal point. 

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The p result is 28361.667
=begin
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

PROBLEM:
- Given an integer,
- Calculate the square of the sum of first n positive integers
- Calculate the sum of the squares of the first n positive integers
- calculate the difference

RULES:
- The range will be from 1 to the given integer

EXAMPLES:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

sum_square_difference(10) == 2640
sum_square_difference(1) == 0 -- EDGE CASE, return 1
sum_square_difference(100) == 25164150

DATA STRUCTURES:
Input: Integer

Range of numbers from 1 to input integer (inclusive)

output: integer

ALGORITHM:
Given a number,
- CREATE a range of numbers from 1 to the number (inclusive)
- CALCULATE the square of the sum
  - sum all integers in the range
  - square the sum

- CALCULATE the sum of the square
  - square each integer in the range
  - sum all the square results

- CALCULATE the difference
  - subtract sum of squares from square of sums
- RETURN the result
=end

def calculate_square_sums(number)
  ((1..number).sum) ** 2
end

def calculate_sum_of_squares(number)
  (1..number).reduce { |memo, num| memo + num**2 }
end

def sum_square_difference1(number)
  square_sum = calculate_square_sums(number)
  sum_of_squares = calculate_sum_of_squares(number)

  square_sum - sum_of_squares
end

=begin
# REFACTOR
# #abs2 returns the square of caller
# it works with #sum, why not #reduce?

Enumerable#sum (initial value = 0)
- With no block given, returns the sum of initial_value and the elements
- With a block given, calls the block with each element; returns the sum of initial_value and the block return value


# When #reduce is passed a symbol-method name as an argument, the operands are combined using that method.
(1..3).reduce(:+) works because it performs 1 + 2 + 3
(1..3).reduce(:abs2) doesn't work because #abs2 doesn't combine two arguments, it simply returns the square of one argument.

#reduce would need:
(1..3).reduce do |sum, number|
   memo + number.abs2
end # => this ends up returning the square of the last number in the sequence.

# in order to work with a symbol method name arg, the block would have to stand alone:
(1..3).reduce do |sum, number|
  number.abs2
end

vs: There is nothing in the docs about #sum wiht a symbol-method name as an argument, but I imagine this works due to the built-in behavior of #sum. #sum will always add the return value of the block for each element to the sum.

(1..3).sum do |number|
  number.abs2
end # => the square will be added to the sum

is the same as (1..3).sum(&:abs2)

So, if you want to operate on each element in a sequence, and get the sum of those operations, use either:
  - #reduce with a block
  - #sum with a symbol method name as an argument
=end

def sum_square_difference(number)
  ((1..number).reduce(:+) ** 2) - (1..number).sum(&:abs2)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# TIME: 7:25
=begin
32:20
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

- square of sum of first n positive integers
- sum of the squares of the first n positive integers

Input: Integer
Output: integer (difference)

Rules:
- sum integers between 1.. given integer, then computer square (**2)
- calculate squares of first n positive integers (between 1.. given integer), then get the sum
- answer may be zero

EXAMPLES:
3 == 22
(1 + 2 + 3)**2 (square of sum)
- (1**2 + 2**2 + 3**3) (sum of the squares)

 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

DATA STRUCTURES:
start: integer

range or array of numbers from 1..integer (inclusive)

end: integer

ALGORITHM:
given an integer, number
- calculate square of sums
  * sum first_n_integers, then square the sum (**2)
  * assign result to square_sum
  
- calculate the sum of squares
  * iterate through 1..number range
    * calculate current integer ** 2
    * increment sum_squares by result

- calculate: square_sum - sum_squares and return result
=end

def calculate_square_sum(number)
  (1..number).sum ** 2
end

def calculate_sum_squares(number)
  (1..number).reduce(0) { |sum, number| sum += number**2 }
end

def sum_square_difference(number)
  square_sum = calculate_square_sum(number)
  sum_squares = calculate_sum_squares(number)

  square_sum - sum_squares
end

# LS Solution
  # set sum to 0
  # set sum_of_squares to 0
  # iterate through range 1..number
    # increment sum by value
    # increment sum of squares by value**2
  # sum**2 - sum_of_squares

def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# TIME: 10:00
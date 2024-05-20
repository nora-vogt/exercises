=begin

PROBLEM:
Write a method that computes the nth fibonacci number, where nth is the argument to the method. Use recursion.

Fibonacci:
- sequence starts with 1, 1
- each number is the sum of the previous two numbers

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2 

fibonacci(1) should return 1
fibonacci(2) should return 1
fibonacci(3) should return 2
fibonacci(4) should return 3
fibonacci(5) should return 5


ALGORITHM:
Given an integer, " "
- return 1 if n < 2
- otherwise, use given formula:
  - call fibonacci(n - 1)
  - add return value of fibonacci(n - 2)
  - F(n - 1) + F(n - 2)
=end

# n = 3; method returns 2


# Different starting ("seed") values for Fibonacci - there seem to be different math interpretations

# Fibonacci with seed values 1, 1
  # This method: fibonacci(0) == 1
def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end


# Fibonacci with seed values 0, 1 (to get the first number, 1)
  # This method: fibonacci(0) == 0
def fibonacci(n)
  return n if n < 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(6) == 8
p fibonacci(12) == 144
p fibonacci(20) == 6765
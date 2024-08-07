=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:

    They call themselves at least once.
    They have a condition that stops the recursion (n == 1 above).
    They use the result returned by themselves.

In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

PROBLEM:
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2


Write a recursive method that calculates the value of the nth number in the Fibonacci sequence.

RULES:
- use recursion
  - recursive method must:
    - call itself at least once
    - have a condition to stop the recursion
    - use the result returned by themselves (the method's return value)
- a fibonacci number is the sum of the prior two numbers, where first two numbers in sequence are both 1

EXAMPLES:
fibonacci: 1, 1, 2, 3, 5, 8...

fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

DATA STRUCTURES:
Input: integer (the nth fibonacci number)

no strutures - just result of addition

Output: integer (what the actual number is)

ALGORITHM:
Given a number, n, the position of desired number in the fibonacci sequence:

- return 1 if n <= 2
- call the fib method with (n - 1), add fib method with (n - 2) as an arg

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

=end

def fibonacci(n) # 4
  return 1 if n <= 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

=begin

# the method will continue to call itself until we hit the "return n if n < 2" condition.
  # this means, the method will always return 0 or 1
  # the stack will keep track of returned values,
  # ultimately adding those 0s and 1s to get our desired number

# aka: each method call works down the tree, until the method ultimately returns n (when n is less than 2)
# the method is essentially adding the sums of all those returned 1s to get the desired number

# fibonacci(3) = fib(2) + fib(1)
means: the 3rd fib number is made from adding the 2nd fib number and 1st fib number

https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e#.qxl7hr56e
* Recursion will happen till the bottom of each branch in the tree structure is reached with the resulting value of 1 or 0. *

It is important to note that, except for the case where we want to know what the values of fibonacci(0) or fibonacci(1) is, the final return value of the requested Fibonacci number will come from the following line of code in the method:
    fibonacci(number - 1) + fibonacci(number - 2)
=end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
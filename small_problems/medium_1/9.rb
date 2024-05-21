=begin
Rewrite fibonacci method to not use recursion.

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

ALGORITHM:
Given a number, n
- SET fibonacci_numbers to an array containing [1, 1]
- SET index to 1
- start a loop, loop until fibonacci_numbers.size == n
  - add fibonacci_numbers[index] to fibonaci_numbers[index - 1]
  - push result into fibonacci_numbers
  - increment index by 1

- return element in fibonacci_numbers at index position n - 1
=end

# def fibonacci(n)
#   fibonacci_numbers = [1, 1]
#   index = 1
#   while fibonacci_numbers.size < n
#     fibonacci_numbers << fibonacci_numbers[index] + fibonacci_numbers[index - 1]
#     index += 1
#   end
#   fibonacci_numbers[n - 1]
# end

# LS Solution
  # parallel assignment of first, last to an array containing [1, 1] (the first two fib numbers)
  # start iteration on 3 (the 3rd fib number, because we already have first two)
  # iterate from 3 up to nth number
    # reassign first to the value of last
    # reassign last to the sum of first + last
    # first = 1, last = 3
    # 3..7 
      # after first, last = [last, first + last] on each iteration
        # "first is 1, last is 2"
        # "first is 2, last is 3"
        # "first is 3, last is 5"
        # "first is 5, last is 8"
        # "first is 8, last is 13"
  # return last

  # On each iteration, the array updates to include the two most recent fibonacci numbers

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#     p "first is #{first}, last is #{last}"
#   end

#   last
# end

# def fibonacci(n)
#   first, last = [1, 1]
#   while n > 2
#     next_num = first + last
#     first, last = last, next_num
#     n -= 1
#   end
#   last
# end

# Fibonacci with memoization
CACHE = {}

def fibonacci(n)
  return 1 if n <= 2
  return CACHE[n] if CACHE.keys.include?(n)
  CACHE[n] = fibonacci(n - 1) + fibonacci(n - 2)
  CACHE[n]
end


p fibonacci(7) == 13
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
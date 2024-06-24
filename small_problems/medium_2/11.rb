=begin
A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.


Input: integer (number to check)
Output: boolean (true if input is prime, false if not)

Rules:
- a prime number is only divisble by 1 and itself
- the only even prime number is 2
- all other even prime numbers are divisible by 2
- 1 is not a prime number (it only has 1 factor, itself, whereas other primes have 2 factors (number and 1))

Qs:
- how to handle 0?

DATA STRUCTURES:
start: integer

- array or range of numbers between 2..number - 1

end: boolean

ALGORITHM:
given a number,
- CHECK if number is less than or equal to 1, return false if true
- CHECK if number is greater than 2 and even, return false if true
- CREATE a range from 2..number - 1
- ITERATE through the range
  - CHECK if given number is evenly divisible by range number
    - if true: return false
    - if false: continue iterating
- if given number is not evenly divisible by any range number,
- RETURN true
=end

def is_prime(number)
  return false if number == 1 || (number > 2 && number.even?)

  (2..number - 1).none? do |divisor|
    number % divisor == 0
  end  
end

# LS Solution
  # The largest possible number that can be a divisor of the argument is
  # the square root of the argument. -> Math::sqrt
  # should work well up to about 15-digit numbers

def is_prime(number)
  return false if number == 1
  (2..Math.sqrt(number)).each do |divisor|
    p divisor
    return false if number % divisor == 0
  end

  return true
end

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true

# # TIME: 8:19
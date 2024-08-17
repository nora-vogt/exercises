=begin
A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

PROBLEM:
Determine if the given integer is prime.

RULES:
- 1 is not a prime number
- Prime number = a positive number that is only evenly divisible by itself and 1
- do not use Ruby's Prime class

Examples:
puts(is_prime?(1) == false)              # true -- EDGE CASE
puts(is_prime?(2) == true)               # true
puts(is_prime?(3) == true)               # true
puts(is_prime?(4) == false)              # true
puts(is_prime?(5) == true)               # true
puts(is_prime?(6) == false)              # true
puts(is_prime?(7) == true)               # true
puts(is_prime?(8) == false)              # true
puts(is_prime?(9) == false)              # true
puts(is_prime?(10) == false)             # true
puts(is_prime?(23) == true)              # true
puts(is_prime?(24) == false)             # true
puts(is_prime?(997) == true)             # true
puts(is_prime?(998) == false)            # true
puts(is_prime?(3_297_061) == true)       # true
puts(is_prime?(23_297_061) == false)     # true

DATA STRUCTURES:
Input: integer

range of numbers from 2 to square root of integer

Output: Boolean (true if prime)

ALGORITHM: 
Given a number,
- RETURN false IF the number is <= 1 (prime must be positive)
- CHECK IF number is prime
  - ITERATE from 2 to the square root of the number [divisor]
    - for the current divisor,
    - IF the number is evenly divisible by the divisor
      - RETURN false - number not prime

- RETURN true
=end

def is_prime?(number)
  return false if number <= 1

  (2..Math.sqrt(number)).none? { |divisor| number % divisor == 0 }
  end

puts(is_prime?(1) == false)              # true
puts(is_prime?(2) == true)               # true
puts(is_prime?(3) == true)               # true
puts(is_prime?(4) == false)              # true
puts(is_prime?(5) == true)               # true
puts(is_prime?(6) == false)              # true
puts(is_prime?(7) == true)               # true
puts(is_prime?(8) == false)              # true
puts(is_prime?(9) == false)              # true
puts(is_prime?(10) == false)             # true
puts(is_prime?(23) == true)              # true
puts(is_prime?(24) == false)             # true
puts(is_prime?(997) == true)             # true
puts(is_prime?(998) == false)            # true
puts(is_prime?(3_297_061) == true)       # true
puts(is_prime?(23_297_061) == false)     # true


# TIME: 6:00
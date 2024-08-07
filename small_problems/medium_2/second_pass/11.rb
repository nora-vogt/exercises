=begin
A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

PROBLEM:
Given a number, determine if it is prime. Return true if yes, false if no.

RULES:
- Prime number: only divisible by 1 and itself
  - meaningL it has two factors
- 1 is not prime - it only has one factor
- do not use Ruby's Prime class
- 2 is prime
  - even numbers greater than 2 cannot be prime (they are always evenly divisible by at least 1, 2, self)

EXAMPLES:
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

DATA STRUCTURES:
need:
  - to determine if the number is evenly divisible by anything other than 1 and itself

Input: integer (number to test for prime)

range of numbers between 2 and 1 less than the number

Output: boolean

ALGORITHM:
given a number, number
+ return false if number is 1
+ determine if it is prime
  - create a range between 2 and (number - 1)
  - iterate through the range - #none?
    - for each divisor,
    - check if number is evenly divisible by divisor
      - if yes for ANY divisor, return false -> the number is not prime
    - if no for ALL divisors, return true -> the number is prime
=end

def is_prime1(number)
  return false if number == 1
  return false if number > 2 && number.even?

  (2..number - 1).none? do |divisor|
    number % divisor == 0
  end
end

=begin
# LS faster Solution
  # Instead of checking all possible divisors,
  # only checks numbers that ARE divisors of the argument.
  # The largest possible divisor of a number is the square root of the number.
    # The square root is the factor of the number that can be multiplied by itself to equal the number.
      square root 36: 6
# The solution works well up to about 15 digits
=end

def is_prime2(number)
  return false if number == 1

  (2..Math.sqrt(number)).each do |divisor|
    if number % divisor == 0
      return false
    end
  end

  return true
end

# Refactor
def is_prime(number)
  return false if number == 1

  (2..Math.sqrt(number)).none? do |divisor|
    number % divisor == 0
  end
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


# TIME: 10:00
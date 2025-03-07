=begin
# PROBLEM: Write a program that calculates the Aliquot sum of a number and returns if the number is perfect, abundant, or deficient

- Aliquot sum: Sum the positive divisors of a number, compare that sum to the number
- The number itself is not a divisor (ex: 15 divisors are 1, 3, 5)
- Perfect numbers have an Aliquot sum that is equal to the original number.
- Abundant numbers have an Aliquot sum that is greater than the original number.
- Deficient numbers have an Aliquot sum that is less than the original number.
- Given a negative number should raise a Standarderror
- Prime numbers are always deficient - only divisor is 1

Questions:
- How to handle 0?

# EXAMPLES

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.


# DATA STRUCTURES 

# ALGORITHM
::classify - takes an integer, returns a string - perfect, abundant, deficient
- raise an error if number is negative
- calculate divisors
- if divisors sum is equal to number, return perfect
- if divisors sum is less than number, return deficient
- otherwise return abundant


::divisors - gets all the divisors of givennumber
- iterate from 1 up to half of the number
- check if number is evenly divisible by current number
- if yes, select number
- return an array of divisors
=end

# class PerfectNumber
#   def self.divisors(number)
#    (1..(number/2)).select { |candidate| number % candidate == 0 }
#   end

#   def self.classify(number)
#     raise StandardError if number < 1
#     sum = divisors(number).sum

#     if sum < number 
#       'deficient'
#     elsif sum > number
#       'abundant'
#     else
#       'perfect'
#     end
#   end
# end

# LS Solution
  # Uses class << self syntax to create what is effectively a private class method
  # class PerfectNumber
  #   def self.classify(number)
  #     raise StandardError.new if number < 1
  #     sum = sum_of_factors(number)
  
  #     if sum == number
  #       'perfect'
  #     elsif sum > number
  #       'abundant'
  #     else
  #       'deficient'
  #     end
  #   end
  
  #   class << self
  #     private
  
  #     def sum_of_factors(number)
  #       (1...number).select do |possible_divisor|
  #         number % possible_divisor == 0
  #       end.sum
  #     end
  #   end
  # end


# Student solution ideas
# Use a case statement, using <=> to compare the sum of divisors to the given number

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    divisors = get_divisors(number)

    case divisors.sum <=> number
    when -1 then 'deficient'
    when 0  then 'perfect'
    when 1  then 'abundant'
    end
  end

  class << self
    private
    def get_divisors(number)
      (1..(number/2)).select { |candidate| number % candidate == 0 }
     end
  end
end
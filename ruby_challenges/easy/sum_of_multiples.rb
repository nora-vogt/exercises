require 'pry'
=begin
# PROBLEM
Given a natural number (positive, whole number) and a set of numbers find the sum of all multiples that are less than the first number.

RULES:
- multiples must be less than given first number
- If a set of numbers is not given, default set is multiples of 3 and 5
- Multiples for the set should be unique - ex for 3 and 5, with a limit of 20, only count 15 once


# EXAMPLES
- all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# DATA STRUCTURES
- array of numbers to get multiples for
- array of all multiples

# ALGORITHM
Instance Methods:
# initialize - takes any number of integer arguments
- if numbers is empty, assign @set to [3, 5]
- otherwise, assign @set to an array of arg integers

# to - takes an integer (limit)
- iterate through range from 1 to 1 less than limit - #select
  - for each possible multiple, iterate through @set - #any?
    - check if possible multiple is evenly divided by set number
    - if yes, select the multiple
- sum the resulting array
- return sum

Class Methods:
::to - takes an integer (end of range)
- initialize a new SumofMultiples instance with no args
- call #to on instance
=end

class SumOfMultiples
  attr_reader :set

  def initialize(*numbers)
    @set = numbers.empty? ? [3, 5] : numbers
  end

  def to(limit)
    (1...limit).select do |possible_multiple|
      @set.any? { |number| possible_multiple % number == 0 }
    end.sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
end

=begin
# LS Solution - very similar

# initialize - basically same, checks size of *multiples

# to - takes an integer, limit
- iterates from 1 to 1 less than the limit
- for each number, check if it is a multiple of any number in @multiples
  - if yes, select the number
- sum the resulting array
- return the sum

# any_multiple? - takes an integer (current number to check)
- iterates through @multiples (aka @set) 
  - check if the given number is a multiple of the current multiple
    - check if number is evenly divisible by multiple
=end
class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end

# Student solution idea: use #step up to limit to find multiples! My code:
# Create a range from current number to 1 less than limit
  # Iterate through the range with #step - make the step value the same as number
  # In practice this iterates like: 3, 6, 9, 12 -- only iterates through multiples
  # add multiple to multiples array, unless it already includes that multiple
  # sum the multiples

class SumOfMultiples
  attr_reader :set

  def initialize(*numbers)
    @set = numbers.empty? ? [3, 5] : numbers
  end

  def to(limit)
    multiples = []
    set.each do |number|
      (number...limit).step(number) do |multiple|
        multiples << multiple unless multiples.include?(multiple)
      end
    end

    multiples.sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
end

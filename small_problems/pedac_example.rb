=begin
Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors. 

For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78. If no factors are given, use 3 and 5 as the default factors.
=end

def sum_of_multiples(target, factors)
  multiples = []  # create empty array to contain multiples
  factors = [3, 5] if factors.length == 0 # if no factors, set the list

  factors.each do |factor|  # for every factor in factors
    current_multiple = factor # set current multiple to factor

    while current_multiple < target # while value of current_multiple is less than target number
      multiples << current_multiple # add the current multiple to the multiples array
      current_multiple += factor  # increment current_multiple by the amount of factor (ex: current multiple starts with 3 -> current_multiple = current_multiple + 3 (6))
    end
  end

  multiples.uniq.inject(0, :+)
end

p sum_of_multiples(20, [3, 5])  # returns 78
p sum_of_multiples(20, [3])     # returns 63
p sum_of_multiples(20, [5])     # returns 30
p sum_of_multiples(20, [])      # returns 78
p sum_of_multiples(1, [])       # returns 0
p sum_of_multiples(20, [19])    # returns 19
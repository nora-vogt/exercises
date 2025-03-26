require 'pry'
=begin
# Internal vs External Iterators

When using map/each/etc on a collection object, we're using "internal iteration."
- The process and implementation of that iteration is hidden from us
- The process that allows us to progres through a collection is part of that hidden implementation


External Iteration
- Takes place at the behest of the user
- We can use this type of iteration with the Enumerator class

Reqs:
- Create a new Enumerator object
  - define the values that are iterated upon
- The values should be an infinite list of factorials

To test it:
- Print out the first 7 factorials, starting with zero factorial
- Print the first 7 using an "External Iterator"
- After that, see what happens if you print 3 more factorials
- Next, reset your Enumerator with the #rewind method
- Finally, print 7 more factorials

A factorial is: Result of multiplying a sequence of positive numbers together.
- 0! and 1! are both defined to be 1
- All subsequent values are the result of multiplying integers from 1..n together
- ex: 5! is 5 * 4 * 3 * 3 * 1 == 120

Hints:
- Only need 3 Enumerator methods for this exercise
- Enumerator includes Enumerable module. May need to use methods from the module?


Enumerator#next - returns the next value of the iterator or raises StopIteration if Enumerator is at the end

Enumerator#feed - sets hte value to be returned by the next yield inside enumerator
  - if the value is not set, the yield returns nil
  - this value is cleared after being yielded

Enumerator#rewind - rewinds the enumeration sequence to the beginning

Enumerator::new
- the block param is a "yielder" object, which can be used to yield a value buy valling the yield method

Enumerable#take - for a non-negative integer n, returns the first n elements


# Helpful Stack Overflow post: https://stackoverflow.com/questions/19659326/enumerator-as-an-infinite-generator-in-ruby
=end

# def factorial(n)
#   return 1 if [0, 1].include?(n)
#   (1..n).reduce(1) { |total, number| total * number }
# end

# p factorial(0) == 1
# p factorial(1) == 1
# p factorial(5) == 120
# p factorial(8)

# This uses internal iteration with #reduce
# factorial = Enumerator.new do |yielder|
#   number = 0
#   loop do
#     factorial = (1..number).reduce(1) { |acc, number| acc * number }
#     yielder << factorial
#     number += 1
#   end
# end

=begin
Start the accumulator at 1
number = 0
number * accumulator = 0 (need to correct to 1)


accumulator  1
number = 1 (1!)
number * accumulator = 1

accumulator = 1
number = 2 (2!)
2 * 1 = 2

accumulator = 2
number = 3
3 * 2 = 6

accumulator = 6
number = 4

4 * 6 = 24
=end

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : number * accumulator
    yielder << accumulator
    number += 1
  end
end

p factorial.take(7)
#p factorial.take(3) # Raises a NoMethodError - undefined method `take' for 720:Integer (NoMethodError)
factorial.rewind
puts factorial.take(7)

# External iterators
7.times { puts factorial.next }
3.times { puts factorial.next } # This alternative keeps going - the enumerator is tracking where in the sequence we are
factorial.rewind
7.times { puts factorial.next }


# Internal iterators
factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 6
end
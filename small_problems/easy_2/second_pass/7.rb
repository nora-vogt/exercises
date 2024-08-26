=begin
Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
=end

#puts (1..99).select(&:even?)

#(2..99).step(2) { |num| puts num }

#(1..99).each { |num| puts num if num.even? }

# number = 2
# while number <= 99
#   puts number
#   number += 2
# end

1.upto(99) { |num| puts num if num % 2 == 0 }
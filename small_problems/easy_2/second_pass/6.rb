=begin
Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
=end

def print_odds
  1.upto(99) { |number| puts number if number.odd? }
end

print_odds

number = 1
while number <= 99
  puts number
  number += 2
end

(1..99).step(2) { |number| puts number }

puts (1..99).select(&:odd?)

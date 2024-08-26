=begin
Tip calculator

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

ALGORITHM:
- GET the bill amount from the user
  - convert input to float
  - SET to "bill"
- GET the tip percentage from the user
  - convert the input to a float
  - divide input by 100
  - SET to percentage
- MULTIPLY bill by percentage, SET to tip
=end

print "What is the bill? " 
bill = gets.to_f

print "What is the tip percentage? "
percentage = gets.to_f / 100

tip = (bill * percentage)
total = (bill + tip)

puts "The tip is #{format('%.2f', tip)}"
puts "The total is #{format('%.2f', total)}"

# Further Exploration - always print 2 decimal places
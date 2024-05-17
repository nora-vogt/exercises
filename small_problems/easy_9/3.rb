=begin
Input: integer
Output: array of integers between 1 and input

Rules:
- input will always be a valid integer greater than 0
- the sequence is all numbers from 1 up to and including input

ALGORITHM:
- given an integer, number
- create a range from 1..number
- add all numbers from range to an array
- return that array
=end

# def sequence(number)
#   (1..number).to_a
# end

# # Using Array::new
#   # first arg is size of array, will be equal to number
#   # block param is index, starting at 0
# def sequence(number)
#   p Array.new(number) { |index| index + 1}
# end

# Further Exploration
# What should sequence return if arg is not greater than 0?
  # If input is less than 0, the sequence should be from 1 to input

def sequence(number)
  number <= 0 ? (number..1).to_a.reverse : (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [1, 0, -1, -2, -3, -4, -5]
p sequence(-1) == [1, 0, -1]
p sequence(0) == [1, 0]
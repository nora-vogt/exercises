=begin
Input: 
- integer (count)
- integer (first number of sequence)

Output:
- array, containing N values that are multiples of starting number

Rules:
- A multiple is a number that is evenly divisible by zero
- Count argument will always have a value of 0 or greater
- If count is 0, return an empty array
- The starting number can be any integer, positive or negative
- first number in sequence is starting_number (because it is a multiple)

EXAMPLES:
5, 1
count: 5
start: 1
1, 2, 3, 4, 5

4, -7
-7, -14, -21, -28

ALGORITHM:
given an integer "count" and an integer start_number,
- create array "multiples" set to empty array  
- set "multiplier" to 1
- start a loop, loop while multiples.size < count
  - multiply start_number * multiplier and add to multiples
  - increment multiplier by 1
- return multiples array
=end

# First solution
# def sequence(count, start_number)
#   multiples = []
#   multiplier = 1
#   while multiples.size < count
#     multiples << start_number * multiplier
#     multiplier += 1
#   end

#   multiples
# end

# # Refactor
# def sequence(count, start_number)
#   multiples = []
#   count.times { |i| multiples << start_number * (i + 1) }
#   multiples
# end

# # Second Solution
def sequence(count, start_number)
  (1..count).map { |multiplier| start_number * multiplier }
end

# LS Solution
def sequence(count, start_number)
  sequence = []
  number = start_number

  count.times do 
    sequence << number
    number += start_number
  end

  sequence
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
=begin
Problem: Write a method that takes an array of integers. Starting at index 0, find the sum of each leading subsequence (indices: 0; 0+1; 0+1+2; etc). Add all the sums and return that number.

Input: array
Output: Integer (sum of sums)

Rules:
- Sum leading subsequences starting at index 0
- A subsequence is 0; 0 + 1; 0 + 1 + 2; etc
- The array always contains at least one number
- If the array contains just one number, return that number
- array will contain integers

EXAMPLES:
[3, 5, 2]
subsequences:
3 = 3
3 + 5 = 8
3 + 5 + 2 = 10
= 21

[4]
4 = 4
= 4

DATA STRUCTURE:
start: array of integers
middle: array of subsequence sums
end: integer

ALGORITHM:
given an array,
- create "sums" set to []
- create "sequence_length" set to 1
- start a loop, iterate while sequence_length <= array.length
  - on each iteration, get a slice from array from [start_index, sequence_length]
  - sum the numbers in the slice
  - add sum to "sums"
  - increment start_index by 1
  - increment sequence_length by 1
- sum "sums" and return that number
=end

# Solution 1
def sum_of_sums(array)
  sums = []
  sequence_length = 1
  while sequence_length <= array.length
    sums << array[0, sequence_length].sum
    sequence_length += 1
  end
  sums.sum
end

# Solution 2
def sum_of_sums(array)
  sums = []
  array.length.times do |count|
    sums << array[0, count + 1].sum
  end
  sums.sum
end

# LS Solution - using #each
def sum_of_sums(numbers)
  total_sum = 0
  accumulator = 0

  numbers.each do |number|
    accumulator += number
    total_sum += accumulator
  end
  
  total_sum
end

# LS Solution - using #upto
def sum_of_sums(numbers)
  total_sum = 0
  1.upto(numbers.length) do |count|
    total_sum += numbers[0, count].reduce(:+)
  end
  total_sum
end

# Cool Student Solution
def sum_of_sums(numbers)
  sum = 0
  numbers.map { |number| sum += number }.reduce(:+) # or could use #sum
end

p sum_of_sums([3, 5, 2]) == 21 #(3) + (3 + 5) + (3 + 5 + 2)
p sum_of_sums([1, 5, 7, 3]) == 36 #(1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
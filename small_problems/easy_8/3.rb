=begin
Input: string
Output: array of all substrings

Rules:
- order array by where in the string the substring begins
  - all substrings that start at index 0 should come first
    - ex: 'abc' -> a, ab, abc, b, bc, c
- substrings at a given index position should be ordered shortest to longest
- use the leading_substrings method from previous exercise

ALGORITHM:
- given a string
- create "substrings" set to empty array
- get all possible substrings
  - start a loop, iterate from 0 to string.length - 1
  - on each iteration, call leading_substrings and pass string[start_index..-1]
  - increment start_index by 1 on each loop
  - add returned array to substrings
- flatten substrings array and return
=end

def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |length|
    substrings << string[0, length]
  end
  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |start_index|
    substrings << leading_substrings(string[start_index..-1])
  end
  substrings.flatten
end

# refactor
def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |start_index|
    substrings.concat(leading_substrings(string[start_index..-1]))
  end
  substrings
end

# LS Solution - using #each
def substrings(string)
  substrings = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    substrings.concat(leading_substrings(this_substring))
  end
  substrings
end

# Another
def substrings(string)
 Array.new(string.size) { |index| leading_substrings(string[index..-1]) }.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
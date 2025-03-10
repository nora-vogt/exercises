require 'pry'
=begin
# PROBLEM
Given a string, write a program that returns all possible series of consecutive numbers of a specified length.

RULES:
- if asking for a 6-digit series from a 5-digit string, throw an error (or any length mismatch?)
- return each series as a digit within a subarray within an array
- series can overlap: "123" with a series length of 2 has "12" and "23"
- series length may be 1

# EXAMPLES
"01234" has the following 3-digit series:
    012
    123
    234

"01234" 4-digit series:
    0123
    1234

'01234'
assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)

# DATA STRUCTURES
start: string number

string number -> integer -> array of digits

end: nested array

BRAINSTORM:

"01234" - 2
convert string to array of string digits
get consecutive slices - each_cons
'01', '12', '23', '34'

for each series '01'
  check if all numbers are consecutive
  -

# ALGORITHM
instance methods:
# initialize - takes a string
- assign to @number_string

# slices - takes an interger (series length)
- raise an ArgumentError if integer is greater than length of @number as a string
- convert @number_string to an array of digits
- create result subarray
- iterate through array
  - create subarrays that are length in size
  - add subarray to results subarray
- return result array
=end

class Series
  def initialize(string)
    @number_string = string
  end

  def slices(length)
    raise ArgumentError if length > @number_string.size
    digits = @number_string.chars.map(&:to_i)
    digits.each_cons(length).to_a
  end
end

=begin
# LS Solution - the same, except they chained all array operations on one line
=end
class Series
  attr_accessor :number_string

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end

=begin
# Student solution using #filter_map
# Enumerable#filter_map - combines select with map, essentially
- returns a new array containing only truthy values returned by the block
=end
class Series
  attr_accessor :number_string

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    digits = number_string.chars.map(&:to_i)
    digits.filter_map.with_index do |_, index|
      slice = digits[index, length]
      digits[index, length] if slice.size == length
    end
  end
end


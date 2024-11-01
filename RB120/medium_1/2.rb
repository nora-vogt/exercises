=begin
A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

The code should output true 16 times.
=end
class FixedArray
  def initialize(size)
    @array = Array.new(size)
    @size = size
  end

  def [](index)
    # LS Solution: #fetch already raises IndexError
    # @array.fetch(index)

    raise IndexError unless (-@size..@size).include?(index)
    @array[index]
  end

  def[]=(index, value)
    # LS Solution:
    # self[index] # will raise IndexError if index is invalid
    raise IndexError unless (-@size..@size).include?(index)
    @array[index] = value
  end

  def to_a
    # array.clone
    @array
  end

  def to_s
    @array.inspect
  end
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
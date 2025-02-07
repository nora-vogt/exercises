=begin
# max_by - returns the item for which the block returned the largest value
- if given array is empty, max_by should return nil
=end

def max_by1(array)
  block_values = array.map { |value| yield(value) }
  largest_block_value = block_values.max
  index = block_values.index(largest_block_value)

  index ? array[index] : nil
end

def max_by(array)
  largest = array[0]
  array.each { |item| largest = item if yield(item) > yield(largest) }
  largest
end

# LS
def max_by3(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
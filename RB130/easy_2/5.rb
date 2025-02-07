=begin
- #drop_while iterates over a collection, passing each element, until the block returns a falsy value.
- it then convers the remaining elements of the collection (including the element that returned a falsy value) to an array, and returns that array
=end

def drop_while1(collection)
  result = []
  collection.each_with_index do |value, index|
    unless yield(value)
      result += collection[index..-1]
      break
    end
  end
  result
end

# LS
def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
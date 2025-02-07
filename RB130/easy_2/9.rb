=begin
- Enumerable#each_cons - iterates over a collection, taking each sequence of n consecutive elements at a time and passign them to the block.
- Method returns a value of nil (actual each_cons returns self, the caller or an enumerator if no block given)

# this one should take the elements 2 at a time
# return nil
=end

def each_cons1(array)
  index = 0

  while index < array.size - 1
    yield(array[index], array[index + 1])
    index += 1
  end

  nil
end

def each_cons2(array)
  array[0..-2].each_with_index { |item, index| yield(item, array[index + 1]) }
  nil
end

def each_cons(array)
  array.inject do |memo, item|
    yield(memo, item)
    item
  end
  nil
end



hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
=begin
- create a map method
- take an array and a block as an argument
- must return a new array with same number of items as the original
  - items are the values returned by the block
- if array is empty, return an empty array
=end

def map(collection) # modified to work with Hash, Set - blocks having lenient arity means we can specify two block parameters, and this code will work when only passing 1 value (like for arrays)
  result = []
  collection.each { |value1, value2| result << yield(value1, value2) }
  result
end

def map2(array)
  array.each_with_object([]) { |value, result| result << yield(value) }
end

def map3(array)
  array.reduce([]) do |result, value|
    result << yield(value)
  end
end

def map4(array) # Doesn't work with hash
  result = []
  index = 0
  while index < array.size
    result << yield(array[index])
    index += 1
  end
  result
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({a: 1, b: 2, c: 3}) { |key, value| "#{key}: #{value += 10}" } == ["a: 11", "b: 12", "c: 13"]
p map(Set['macrodata refinement', 'mammalians nurturable']) { |value| value + '!!'} == ['macrodata refinement!!', 'mammalians nurturable!!']
def each_with_object1(array, object)
  array.each { |value| yield(value, object) }
  object
end

def each_with_object2(array, object)
  array.reduce(object) do |obj, value|
    yield(value, obj)
    obj
  end
end

def each_with_object(array, object)
  index = 0
  while index < array.size
    yield(array[index], object)
    index += 1
  end
  object
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}
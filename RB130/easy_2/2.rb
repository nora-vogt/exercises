=begin
The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:

[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

- create an empty result array
- iterate through array1, with index
  - get element at index in array1, array2
  - push elements into new array
  - push new array to result array
- return result array
=end

def zip1(array1, array2)
  result = []
  0.upto(array1.size - 1) do |index|
    result << [array1[index], array2[index]]
  end
  result
end

# alt
def zip2(array1, array2)
  array1.map.with_index do |element, index|
    [element, array2[index]]
  end
end

# LS 
def zip(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), new_arr|
    new_arr << [element, array2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
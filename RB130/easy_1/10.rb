=begin
Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Further Exploration

Write a version of the count method that meets the conditions of this exercise, but also does not use each, loop, while, or until.
=end

def count1(array)
  count = 0
  array.each { |value| count += 1 if yield(value) }
  count
end

def count2(array)
  count = 0
  for value in array
    count += 1 if yield(value)
  end
  count
end

def count3(array)
  count = 0
  array.size.times do |index|
    count += 1 if yield(array[index])
  end
  count
end

def count(array)
  array.reduce(0) do |count, value|
    yield(value) ? count + 1 : count
  end
end


p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
require 'pry'
=begin
- return a count of items for which the block returns a truthy value
- count should accept any number of argments and a block
  - return the total number of arguments for which the block returns true
=end

def count1(*values)
  total = 0
  values.each { |value| total += 1 if yield(value) }
  total
end

def count2(*values)
  values.reduce(0) { |total, value| yield(value) ? total += 1 : total }
end

def count(*values)
  values.each_with_object([]) { |value, arr| arr << value if yield(value) }.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
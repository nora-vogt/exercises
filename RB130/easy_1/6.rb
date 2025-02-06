require 'set'
require 'pry'
=begin
A great way to learn about blocks is to implement some of the core Ruby methods that use blocks using your own code. Over this exercise and the next several exercises, we will do this for a variety of different standard methods.

The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for any element, then #any? returns true. Otherwise, #any? returns false. Note in particular that #any? will stop searching the collection the first time the block returns true.

Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard Ruby method that is named all?, any?, none?, or one?.

iterate through the array
  - yield each element to the block
  - capture return value of the block
    - if block returns a truthy value -> stop iterating and return true
    - if block retusn a falsy value -> keep iterating

- return false from the method
=end

def any?(array)
  array.each do |value|
    return true if yield(value)
  end

  false
end

# Further Exploration

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
p any?({a: 1, b: 2, c: 3}) { |_, v| v > 2 } == true # Works with Hashes
p any?({a: 1, b: 2}) { |k, _| k.instance_of? String } == false

p any?(Set[8, 8, 2]) { |value| value > 3} == true # Works with Set instances
p any?(Set[]) { |value| value } == false
p any?(Set['a', 'b', 'cat']) { |value| value.size > 2 } == true
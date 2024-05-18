=begin
Input: array (of nested arrays)
Output: array of strings (correct quantity of each fruit)


Rules:
- each nested array is 2-elements: fruit, quantity
- return value should be an array of separate fruit strings, each fruti listed the quantity number of times from the input

ALGORITHM:
- given an array, "fruits"
- create an empty array, "grocery_list"
- iterate through fruits array
  - add the current fruit to grocery_list the given number of times
- return grocery list array
=end

# First Solution - #each
def buy_fruit(fruits)
  grocery_list = []
  fruits.each do |fruit, count|
    count.times { grocery_list << fruit }
  end
  grocery_list
end

# Second Solution - #each_with_object
def buy_fruit(fruits)
  fruits.each_with_object([]) do |(fruit, count), list|
    count.times { list << fruit }
  end
end

# LS Solution - #map
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
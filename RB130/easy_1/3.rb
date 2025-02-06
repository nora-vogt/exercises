=begin
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

PROBLEM: Given an array of sorted integers, find all of the integers missing from the array that fall between the first/last elements.

- Get first element
- Get last element
- Iterate through an array of ints from first to last element -> select
  - if the current number is NOT included in input array, select the number
  - or with reject: if the current number is included in the array, reject it

=end

def missing1(array)
  (array[0]..array[-1]).to_a.reject do |integer|
    array.include?(integer)
  end
end

# LS Solution
# Iterate through each pair of numbers in input array
# collect the integers that are missing between each integer in the pairs
def missing2(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

#Further Exploration

# Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve this without using a method that requires a block?

# student solution
 # since array is sorted: get min/first, get max/last -> create an array
 # use Array#- to remove numbers from input array
 # remaining nums are the missing nums

def missing(array)
  (array.first..array.last).to_a - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
=begin
https://en.wikipedia.org/wiki/Bubble_sort
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Rules:
- bubble sort iterates through an array multiple times
- on each pass, each pair of consecutive elements is compared
- if first element is greater than second, swap the two elements
- repeat iterating until a complete pass is made without any swaps (array completely sorted)
- mutate the original array to sort

Input: array
Output: same Array object, sorted

NOTES:
to swap 
a, b = b, a

EXAMPLES:
first pass:
6 	2 	7 	1 	4 	Start: compare 6 > 2? Yes (start: index 0, compare 0, 1)
2 	6 	7 	1 	4 	Exchange
2 	6 	7 	1 	4 	6 > 7? No (no exchange) (start: index 1, compare 1, 2)
2 	6 	7 	1 	4 	7 > 1? Yes (start: index 2, compare 2, 3)
2 	6 	1 	7 	4 	Exchange
2 	6 	1 	7 	4 	7 > 4? Yes (start: index 3, compare 3, 4)
2 	6 	1 	4 	7 	Exchange
                                (end on index size - 1)

DATA STRUCTURES:
start: array

- save the array at start of each iteration for comparison

- iterating through array an unknown number of times
- iterate through each index in the array except last one as starting point for comparison
  - compare element at that index with element at index + 1
  - if first element greater, swap the two values

- stop iterating if array value is equal to comparisona rray at start of iteration


end: same array, mutated to sort

ALGORITHM:
given an array, array

- LOOP
  - SET index to 0
  - SET "comparison_array" to a copy of array
    - LOOP 
      
      - compare array[index] to array[index + 1]
        - if first element value is greater, swap the two values, mutating array
        - if first element value is not greater, do nothing
      - increment index by 1
      - break from loop if index == array size - 1
    - END inner loop
  - break if comparison_array == array

- return array
=end

# def bubble_sort!(array)
#   loop do
#     index = 0
#     comparison_array = array.dup
#     loop do
#       if array[index] > array[index + 1]
#         array[index], array[index + 1] = array[index + 1], array[index]
#       end
#       index += 1

#       break if index == array.size - 1
#     end

#     break if comparison_array == array
#   end
#   array
# end

# Refactor
def swap!(array, index)
  array[index], array[index + 1] = array[index + 1], array[index]
end

# can use a swapped boolean instead of comparing copies of the array
# def bubble_sort!(array)
#   loop do
#     index = 0
#     swapped = false
#     loop do
#       if array[index] > array[index + 1]
#         swap!(array, index) 
#         swapped = true
#       end
      
#       index += 1

#       break if index == array.size - 1
#     end

#     break unless swapped
#   end
#   array
# end

# Optimizing Bubble Sort
# First step of optimization
# The n-th pass finds the n-th largest element and puts it into its final place.
# So, the inner loop can avoid looking at the last n - 1 items when running for the n-th time.
  # Ex: the 2nd pass finds the 2nd largest element + arranges it. The inner loop can avoid looking at the last (2 - 1 = 1) 1 item when running for the 2nd time. 
  # 6 2 7 1 4 -> sort on first pass to -> 2 6 1 4 7
    # second pass, ignore the last item (7) because it has already been sorted

def swap!(array, index)
  array[index], array[index + 1] = array[index + 1], array[index]
end

def bubble_sort!(array)
  max_index = array.length- 1
  loop do
    swapped = false
    (0..max_index - 1).each do |index|
      if array[index] > array[index + 1]
        swap!(array, index) 
        swapped = true
      end
    end
    max_index -= 1
    break unless swapped
  end
  array
end

# Second step of optimization
    


array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# TIME: 18:00
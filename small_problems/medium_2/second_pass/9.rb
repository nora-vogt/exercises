=begin
Bubble Sort

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

6   2   7   1   4   Start: compare 6 > 2? Yes
2   6   7   1   4   Exchange
2   6   7   1   4   6 > 7? No (no exchange)
2   6   7   1   4   7 > 1? Yes
2   6   1   7   4   Exchange
2   6   1   7   4   7 > 4? Yes
2   6   1   4   7   Exchange
          
2   6   1   4   7   2 > 6? No
2   6   1   4   7   6 > 1? Yes
2   1   6   4   7   Exchange
2   1   6   4   7   6 > 4? Yes
2   1   4   6   7   Exchange
2   1   4   6   7   6 > 7? No
          
2   1   4   6   7   2 > 1? Yes
1   2   4   6   7   Exchange
1   2   4   6   7   2 > 4? No
1   2   4   6   7   4 > 6? No
1   2   4   6   7   6 > 7? No
          
1   2   4   6   7   1 > 2? No
1   2   4   6   7   2 > 4? No
1   2   4   6   7   4 > 6? No
1   2   4   6   7   6 > 7? No
1   2   4   6   7   No swaps; all done; sorted

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.


PROBLEM:
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

RULES:
- Bubble sort compares consecutive elements in an array
- If the first of the two elements is greater, the elements are swapped
- Bubble sort continues iterating until no more swaps need to be made


Examples

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)

[6 2 7 1 4]
compare 6 and 2 -> swap

[2 6 7 1 4]
compare 6 and 7 -> no swap

[2 6 7 1 4]
compare 7 and 1 -> swap

[2 6 1 7 4]
compare 7 and 4 -> swap

[2 6 1 4 7]

idx increases by 1 each time

iterate until no swaps are made

array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

DATA STRUCTURES:
Input: array

flag to track if a swap occurred
two levels of iteration
top level:
  swapped = false

  second level:
    iterate through indices, from 1 to length - 1
    make swap
    set swapped to true if swap was made
  end

  break if swapped == false
end

Output: same array, but sorted

ALGORITHM:
procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n-1 inclusive do
            { if this pair is out of order }
            if A[i-1] > A[i] then
                { swap them and remember something changed }
                swap(A[i-1], A[i])
                swapped := true
            end if
        end for
    until not swapped
end procedure
=end

def bubble_sort1!(array)
  loop do
    swapped = false

    1.upto(array.length - 1) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end
    end

    break if swapped == false
  end

  array
end

# LS Solution
# Very similar, except the second level loop always performs the swap, but first skips to the next iteration if the element at index - 1 is not greater than element at current index

def bubble_sort2!(array)
  loop do
    swapped = false

    1.upto(array.length - 1) do |index|
      next if array[index - 1] <= array[index]

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end

  # method will return nil from loop
end

# Optimized Bubble Sort 1
=begin
The nth iteration finds the nth largest element and puts it in its final place. So, the inner loop doesn't have to check the last n-1 elements of the array - they have already been sorted to their final position.

n = 1 (first iteration); n - 1 = 0; check all elements because no swap has yet occurred
  - the 1st largest element get sorted into final position

n = 2 (second iteration); n - 1 = 1; check all but last element
  - the 2nd largest element gets sorted into final position, etc

procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n - 1 inclusive do
            if A[i - 1] > A[i] then
                swap(A[i - 1], A[i])
                swapped := true
            end if
        end for
        n := n - 1
    until not swapped
end procedure
=end

def bubble_sort3!(array)
  last_index_to_check = array.length
  loop do
    swapped = false

    1.upto(last_index_to_check - 1) do |index|
      next if array[index - 1] <= array[index]

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    last_index_to_check -= 1
    break unless swapped
  end
end

=begin
# Optimization 2
procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        newn := 0
        for i := 1 to n - 1 inclusive do
            if A[i - 1] > A[i] then
                swap(A[i - 1], A[i])
                newn := i
            end if
        end for
        n := newn
    until n ≤ 1
end procedure
=end

def bubble_sort!(array)
  last_index_to_check = array.length - 1
  loop do
    last_swap_index = 0

    1.upto(last_index_to_check) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        last_swap_index = index
      end
    end
    
    last_index_to_check = last_swap_index
    break if last_index_to_check <= 1
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
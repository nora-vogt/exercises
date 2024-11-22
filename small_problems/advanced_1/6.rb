# Fix the Bug
=begin
The following code:


def my_method(array)
  if array.empty? # if array is empty, return an empty array
    []
  elsif  ## there is no condition given!
    # return a new array, with values squared
    array.map do |value|
      value * value
    end
  else # otherwise, 
    [7 * array.first]
  end
end

is expected to print:
[]
[21]
[9, 16]
[25, 36, 49]

However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

EXAMPLES:
p my_method([]) => [] -- given empty, returns an empty array
p my_method([3]) => [21] -- *EDGE CASE - single element, multiply by 7
p my_method([3, 4]) => [9, 16] -- squares each element
p my_method([5, 6, 7]) => [25, 36, 49] -- squares each element

Input: Array (containing integers or empty)
Output: new array, empty if empty, values squared if size > 1, otherwise with val * 7
=end

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

=begin
As currently written, the method only returns the desired result when passed an empty array. This is due to how the `if..else` statement is written. On line 37, the `if` statement begins and evaluates the condition `array.empty?`. If the array passed in as an argument is empty, this condition will evalaute to `true`, and the `if` branch will be executed, returning an empty array. This becomes the return value of `my_method`. 

If the argument array is not empty, the `elsif` condition will be evaluated. However, in this case, there is no condition specified following the `elsif` keyword. ** Close, but not quite. See LS solution: The Ruby parser evalautes the entire `#map` invocation as the condition, which returns an array, which is truthy, meaning the `elsif` branch will always be executed. However, the code following the branch has been used for the condition, meaning that there is no now code to execute following the branch. "If there is no code in a branch, its equivalent expression is `nil`." This makes the `elsif` branch return `nil`. This occurs for any argument that contains elements, which is why the last three test cases return `nil`.

In order to fix this, we need to specify a condition for the `elsif` to evaluate. If the size of the array is greater than 1, we want to return a new array with each element from the original array squared. Adding `array.size > 1` following the `elsif` will accomplish this. This also produces the desired output when the argument array only contains one element. The `elsif` condition will evalaute to false, and the `else` branch will be executed in that case, returning a new array populated by the result of multiplying the original integer by 7.

[]
nil
nil
nil
=end
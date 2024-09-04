=begin
Transpose MxN

In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a Ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.


RULES:
- rows are each subarray
- columns are each element within the subarray
- matrix may be any size
- matrix must contain at least 1 row and at least 1 column
- transpose: swap columns with rows
- each row will have the same number of columns in the input array

Examples:
transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
- 1 row
- 4 columns
* each column becomes a row (a new subarray)

transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
- 4 rows
- each row has 1 column
* each column (idx 0) becomes a row (1 subarray)

transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
- 3 rows (subarrays)
- 5 columns
* becomes an array with 5 rows (subarrays), 3 elements per row

transpose([[1]]) == [[1]]
- 1 row
- 1 column
- stays the same (but new array)

DATA STRUCTURES:
Input: Matrix (unknown size)

Output: transposed matrix (columns/rows swapped)

BRAINSTORM:
[[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
- 4 rows
- each row has 1 column
* each column (idx 0) becomes a row (1 subarray)

new matrix: []
indices of columns: 0
0 to 0
  row indices: 0-3
  new_row = get all elements at idx 0, push to array or transform


[[1, 2, 3, 4]]) == [[1], [2], [3], [4]]

new matrix: []
indices of columns: 0

col indices: 0 - 3 - iterate
  0- 0
  new row: []
  iterate through indices of rows: 0 to 0 

ALGORITHM:
Given a matrix,
- CREATE a new array for the new matrix
- GET indices of the columns (length of first element in matrix - 1)
- ITERATE through the indices of the columns [column_index]
  - for each column index,
  - create an empty new_row array
  - ITERATE through the indices of the rows (length of matrix - 1) [row_index] -> TRANSFORMATION
    - for each row index,
    - get element in matrix at [row_index][column_index]
    - return the transformed array, assign to new_row
  - PUSH new_row into new matrix array

RETURN new matrix array
=end

def transpose1(matrix)
  new_matrix = []
  max_column_index = matrix[0].length - 1

  0.upto(max_column_index) do |column_index|
    new_row = (0..matrix.length - 1).map { |row_index| matrix[row_index][column_index] }
    new_matrix << new_row
  end

  new_matrix
end

# LS Solution
# the same, except for better named vars and making the # of rows a variable
# also uses exclusive range to avoid length-1
def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# TIME: 12:38
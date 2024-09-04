=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Examples

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

This program should print "true" twice.

RULES:
- do not use Array#transpose or Matrix class
- do not mutate input matrix
- "Transposing" a matrix means turning each column into a row, essentially flipping the matrix (rows become columns, columns become rows)

DATA STRUCTURES:
Input: Nested array

Output: transposed nested array, new Array

BRAINSTORM:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

1  4  3
5  7  9
8  2  6

[ [1, 5, 8], [4, 7, 2], [3, 9, 6] ]

row idx: 0 [1, 5, 8]

[1, 5, 8]
col idx: 0, -> replace with matrix[row: 0, col: 0]
col idx:1, -> replace with matrix[row: 1, col: 0]
col idx: 2, -> replace with matrix[row: 2, col: 0]


ALGORITHM:
Given a matrix,
- Iterate through the matrix, with index [row, row_index] -> transformation
  - for each row/row_index 
  - Iterate through the row, with index [integer, column_index] -> transformation
    - for each integer/column_index
    - GET the subarray in matrix at index column_index, get element at index row_index matrix[column_index][row_index]
    - return that element
  - return the transformed array
- return the transformed matrix
=end

def transpose1(matrix)
  matrix.map.with_index do |subarray, row_index|
    subarray.map.with_index do |integer, column_index|
      matrix[column_index][row_index]
    end
  end
end

=begin
# REFACTOR - iterate by index
ALGORITHM:
- iterate through indices of columns 0
  - iterate through indices of rows 0 1 2 -> must be transformation * moving from array of row elements to an array of column elements
    matrix[row_index][column_index] -> 1
    matrix[row][col] -> 5
    matrix[row][col] -> 8
    [1, 5, 8], push that to new array

or can transform at both levels of iteration
  - inner level constructs the new row
  - outer level returns an array containing the new rows
=end

# works for 3x3, but not for matrices that aren't a square
def transpose2(matrix)
  max_index = matrix[0].length - 1

  (0..max_index).map do |column_index|
    (0..max_index).map do |row_index|
      matrix[row_index][column_index]
    end
  end
end

# works for 3x3, but not for matrices that aren't a square
def transpose(matrix)
  max_index = matrix[0].length - 1
  new_matrix = []

  0.upto(max_index) do |column_index|
    new_row = (0..max_index).map do |row_index|
      matrix[row_index][column_index]
    end

    new_matrix << new_row
  end

  new_matrix
end

# building a new array
=begin
BRAINSTORM

new arr = []

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

1  4  3
5  7  9
8  2  6

iterate through matrix, with index [1, 5, 8] (row, row index)
  iterate through row 1, with index (integer, column_index)
    push current integer to a subarray at index column_index in new_arr
      - if the subarray doesn't exist, create it
=end

def transpose2(matrix)
  new_matrix = []

  matrix.each_with_index do |subarray, row_index|
    subarray.each_with_index do |integer, column_index|
      if new_matrix[column_index]
        new_matrix[column_index] << integer
      else
        new_matrix[column_index] = [integer]
      end
    end
  end

  new_matrix
end

=begin
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

1  4  3
5  7  9
8  2  6

col: 0, 1, 2

# LS Solution
- create a new empty matrix array
- iterate through indices of columns of matrix (length of subarrays/rows - 1) [column_index]
  - construct a new row
   - iterate through the indices of rows of matrix (length of subarrays) [row_index] -> transformation
      - for each row_index,
      - get an element in matrix at matrix[row_index][column_index]
      - return the element
    - push the new array into empty matrix
  - return the new matrix

=end

def transpose3(matrix)
  new_matrix = []
  max_column_index = matrix[0].length - 1
  max_row_index = matrix[0].length - 1

  0.upto(max_column_index) do |column_index|
    new_row = (0..max_row_index).map do |row_index|
      matrix[row_index][column_index]
    end
    new_matrix << new_row
  end

  new_matrix
end


def transpose4(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# TIME: 12:51

# Further exploration - in place transpose
=begin
Given a matrix,
Iterate through indices of each column [column_index]
  Iterate through indices of each row [row_index]
    - for each row_index
    - reassign element at matrix[column_index][row_index] with matrix[row_index][column_index]
- return the transformed array
=end

# First try, this doesn't work, because we are reassigning the elements and also trying to use them - mutating while iterating
def transpose1!(matrix)
  max_index = matrix[0].length - 1

  0.upto(max_index) do |column_index|
    0.upto(max_index) do |row_index|
      matrix[column_index][row_index] = matrix_copy[row_index][column_index]
    end
  end

  p matrix
end

# second try - mutate in place with #map!
=begin
Mutate the matrix with #map!
- iterate through the matrix (row, row_index)
  - create a new empty array for new_row
  - iterate through the columns (column, column index)
    - get element in matrix at matrix[column_index][row_index]
    - push element into new_row
  - return new_row
- return transformed matrix

* NOT WORKING *
=end
def transpose!(matrix)
  matrix.map!.with_index do |row, row_index|
    new_row = []
    row.each_with_index do |column, column_index|
      new_row << matrix[column_index][row_index]
    end

    p new_row
  end
  p matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

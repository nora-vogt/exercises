=begin
Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

RULES:
- rows become columns
- last row becomes first column -> first row becomes last column
- new matrix will have same # of subarrays as elements in original subarray
  - each subarray will have same # of elements as original number of subarrays

EXAMPLES:

Ex 2:
3  4  1
9  7  5

9  3
7  4
5  1

iterate through columns (0..length of first subarray -1) [col idx]
  - new_subarr = []
  iterate through rows (0..length of calling arr - 1) [row_idx]
    get element in arr at [col_idx][row_idx]
      push element into new_subarr
  
  add new_subarr to beginning of empty array


Ex: 1
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

3  4  1
9  7  5
6  2  8

DATA STRUCTURES:
start: nested arrays

middle: empty array
  - build new subarrays while iterating

end: rotated matrix

ALGORITHM:
Given a matrix, 
- CREATE a new empty array to hold rotated matrix
- ITERATE through column indices of input matrix, from 0 to matrix[0].length - 1 [col_index]
  - CREATE new empty array, set to "new_row"
  - ITERATE through row indices of input matrix in reverse, from matrix length - 1 down to 0 [row_index]
    - get element at index row_index in subarray col_index from matrix
    - push to new_row
  - PUSH new_row to matrix
- return result matrix

BRAINSTORM:
3  4  1      9 3
9  7  5      7 4
             5 1

[9, 3]
7, 4[]

col: 0, 1
  row: 1, 0 / 1
    matrix[row][0]


=end

def rotate90(matrix)
  new_matrix = []

  0.upto(matrix[0].length - 1) do |column_index|
    new_row = []
    (matrix.length - 1).downto(0) do |row_index|
      new_row << matrix[row_index][column_index]
    end
    new_matrix << new_row
  end

  new_matrix
end

matrix0 = [
  [3, 4, 1], 
  [9, 7, 5]
]

# [3, 9]
# [4, 7] 
# [1, 5] - reverse each one

p rotate90(matrix0) == [[9, 3], [7, 4], [5, 1]]


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2


=begin
# LS Solution
 - create empty result array
 - get number of rows (size of matrix)
 - get number of columns (size of matrix[0])
 - iterate from 0 to number of columns [col_index]
  - iterate from 0 to number of rows [row_index], with MAP
   - return element from matrix at [row_index][col_index]
  - reverse new subarray returned by map and push to result matrix


# just like transposing, just reverse each new row

# Further Exploration
=end

def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end
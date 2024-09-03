=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

RULES:
- smallest grid will be 7x7
- given int is grid size
- 8 pointed star:
  - top lines / bottom lines all have 3 stars
  - start filling the line: decrease to stars next to each other in center

star(7)

*  *  *   - 3 stars, 2 spaces between
 * * *
  ***
*******
  ***
 * * *
*  *  *


star(9)

*   *   * - 3 stars, 3 spaces between
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

BRAINSTORM:
stars: 3
center_space: grid_size - 3, then divide by 2
side_padding: 0

print stars-space-stars-space-star
  decrease center_space by 1
  increase side_padding by 1
  do this until center_space is 0
then print middle line
=end

def print_row1(grid_size, spaces)
  #puts (' ' * padding) + "*" + (' ' * spaces) + "*" + (' ' * spaces) + "*" + (' ' * padding)

  # Refactor, don't need padding - just center line in grid_size
  puts ("*" + (' ' * spaces) + "*" + (' ' * spaces) + "*").center(grid_size)
end

def star1(grid_size)
  stars = 3
  spaces = (grid_size - 3) / 2
  padding = 0
  half = grid_size / 2

  loop do
    print_row(grid_size, spaces)
    break if spaces == 0
    spaces -= 1
    padding += 1
    
  end

  puts "*" * grid_size
  loop do
    print_row(grid_size, spaces)
    spaces += 1
    break if spaces > (grid_size - 3) / 2
    padding -= 1
  end
end

=begin
# LS Solution
- determine the distance of the first row from the middle row
  - divide grid_size - 1 by 2
  - set to "max_distance"
  - think of this as # of rows in top/bottom half of star
- Iterate max_distance number of times to print each row
  - use #downto
  - for each distance, print the row
- Print the middle line ("*" * grid_size)
- Iterate from 1 upto max_distance to print bottom rows
  - use #upto

Print Row helper method
- Given a grid size, and an integer (current distance from center line)
- determine number of spaces
  - distance_from_center minus 1
- print 3 stars separated by number of spaces, centered in a line that is grid_size length

Relationship of max_distance to number_of_spaces
 - Each line has 1 space less than its distance from center:
  - star(7) - top line max_distance is 3; there are 2 spaces between each star

=end

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

star(7)

star(9)

# TIME: 13:45
require 'pry'
=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

RULES:
- smallest grid will be 7x7
- total number of lines will be n
- n will always be an odd integer
- an 8 pointed star means:
  - 3 stars in top line (stars at start, middle, and end of line)
  - 3 stars next line (stars with increasing spaces)
  - 3 stars next line (stars with space)
  - 3 stars next line (stars in center)
  - middle line: full line of stars (grid size)
  - 3 stars (stars in center)
  - 3 stars next line (stars with space)
  - 3 stars next line (stars with increasing spaces)
  - 3 stars in bottom line (stars at start, middle, and end of line)

Lines that are duplicates:
  - first, last
  - second, second to last
  - third, third to last
  - etc until middle

DATA STRUCTURES:
Input: odd integer

strings

Output: print the eight-pointed star

ALGORITHM: 
Given a number n, the grid size:
- set end_pad to 0
- set space to n / 2
  - loop n number of times [count]
  - build the first line:
    - left pad - star - space - star - space - star - right pad
  - output the first line
    - increment left, right pad by 1 if < n / 2
    - decrement space by 1 if > 0
  
  if count == n / 2 
    - output a line of all stars

  if count > n / 2
    - use line from before
    - decrement left, right pad by 1
    - increment space by 1
=end

# def star1(n)
#   side_space_count = 0
#   space_count = (n / 2 - 1)

#   n.times do |count|
#     side = (" " * side_space_count)
#     space = (" " * space_count)
#     if count < n / 2
#       puts side + "*" + space + "*" + space + "*" + side
#       side_space_count += 1 if side_space_count < (n / 2 - 1)
#       space_count -= 1 if space_count > 0
#     elsif count == n / 2
#       puts "*" * n
#     else
#       puts side + "*" + space + "*" + space + "*" + side
#       side_space_count -= 1
#       space_count += 1
#     end

#   end
# end

# Original Solution Refactored to use #center to center the output, eliminating the need for side padding:
    # The if/elsif conditions are weird because the block param for #times starts at 0
def star(grid_size)
  space_count = (grid_size / 2) - 1
  half_line_width = grid_size / 2

  grid_size.times do |count|
    space = (" " * space_count)
    line = ("*" + space + "*" + space + "*").center(grid_size)
    if count < half_line_width
      puts line
      space_count -= 1 if space_count > 0
    elsif count == half_line_width
      puts "*" * grid_size
    else
      puts line
      space_count += 1
    end
  end
end

# 30 MINS

=begin
# Based on LS solution
  * Find the width of half of the line, excluding center point - max_distance
    - grid_size / 2 - 1
  * Print the top half of the star
    - Iterate from max_distance to 1 [distance]
    - Print the line *
  * Print the middle line
    - '*' * grid_size
  * Print the bottom half of the star
    - iterate from 1 upto max_distance [distance]
    - print the line *

* Print the line *
Given grid_size and an integer, distance_from_center
  * determine the number of spaces between stars
    - set number_of_spaces to distance_from_center - 1
  * build the line
    - set spaces to ' ' * number_of_spaces
    - star - spaces - star - spaces - star
  * center the line in a line that is the length of grid_size
  * print the line
=end

# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   puts ('*' + spaces + '*' + spaces + '*').center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size / 2) - 1
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance) { |distance| print_row(grid_size, distance)}
# end

# # LS Solution
# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   output = Array.new(3, '*').join(spaces)
#   puts output.center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

star(9)
star(15)
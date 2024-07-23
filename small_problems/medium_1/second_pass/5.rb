=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Input: integer (n) - one dimension of grid size
Output: print a 4-pointed diamond

Rules:
- argument will always be odd
- Middle line of diamond has same number of stars as n
- top/bottom line starts with one star in center of line
  - increments/decrements by 2 stars each subsequent line
- distance from side of line to center star is n / 2
- there are n/2 lines above/below the middle line


EXAMPLES:
diamond(1)

*

diamond(3)

 *
***
 *


diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *


DATA STRUCTURES:
Start: n (n * n is grid size)

Range: (n / 2) - 1 
  - spaces on either side of center 
  - number of lines above/below middle

stars increase/decrease by 2 with each line

End: Printed diamond

ALGORITHM:
Given an integer, n
- set distance_to_center to n / 2

- set star_count to 1
- Create the top half of the diamond
  - Iterate from 1 upto distance_from_center
  - print star_count stars centered on a line n chars long
  - increment star_count by 2

- Create the middle line
  - print '*' * star_count

- Create the bottom half of the diamond
- Iterate from 1 upto distance_from center
  - decrement star_count by 2
  - print star_count stars centered on a line n chars long
=end

def diamond1(n)
  distance_from_center = n / 2
  star_count = 1

  1.upto(distance_from_center) do |_|
    puts ('*' * star_count).center(n)
    star_count += 2
  end

  puts ('*' * star_count)

  1.upto(distance_from_center) do |_|
    star_count -= 2
    puts ('*' * star_count).center(n)
  end

end

# Refactor
def diamond(n)
  distance_from_center = n / 2
  star_count = 1

  distance_from_center.times do
    puts ('*' * star_count).center(n)
    star_count += 2
  end

  puts ('*' * star_count)

  distance_from_center.times do
    star_count -= 2
    puts ('*' * star_count).center(n)
  end

end


#diamond(1)
#diamond(3)
diamond(9)

#TIME: 10:22

=begin
LS SOlution

2-parts to solution
  * Build and print a single row of stars
  * Iterate the correct number of times through rows of the diamond

Top/bottom are mirrors of each other

Use a variable `distance` to keep track of how far we are from the center row. 

Center row is 0 distance to itself

distance_from_center is the distance from the center row

ALGORITHM:
Given an integer, grid_size
* Determine the maximum distance from middle row to top row, excluding the middle row
  - subtract 1 from grid_size, then divide by two
  - set to max_distance (from center)
  - this is the count of lines from top to middle

* Iterate to print each row of diamonds
  + print the top + middle
    - iterate from max_distance down to 1 (# of rows from center of diamond, aka - 'distance')
      - for each distance
      - print the row * helper method *

  + print the bottom half
    - iterate from 1 upto max_distance
    - for each distance
    - print the row * helper method *

* Build and print each row of diamonds
Given a grid_size and a distance, distance_from_center (row of diamond)
  - Calculate the number of stars to print (number_of_stars)
  - Start with a row of 9 stars (grid_size), to determine current row:
    - subtract 2 * distance_from_center from 9
  - Build a string of '*' * number_of_stars
  - Center the string within a string of grid_size length
  - output the string

=end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - (2 * distance_from_center)
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  # get the distance from top line to the center
  max_distance = (grid_size - 1) / 2

  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(9)
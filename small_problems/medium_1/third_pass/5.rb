=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

PROBLEM:

RULES:
- 4 pointed diamond
- grid is n x n
- input will always be an odd int
- middle line of diamond has n stars
  - lines/above below subtract 1 star

Examples

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
Input: integer (size of grid)

number of stars

Output: printed star

BRAINSTORM:

top: 1 star, centered in line of n size
middle: n stars
bottom: 1 star, centered in line of n size

print 1 star centered
increase by 1 with each subsequent line, until reaching middle
then, decrease by 1 until only 1 star is printed

star = 1
loop
  print star
  increment star by 2
  stop looping if star > n
end

ALGORITHM:
Given an integer, n,
- CREATE a var to track number of stars to print
  - SET star2 to 1
- PRINT the first half + middle line of diamond
  - LOOP while stars <= n
    - PRINT the line of stars * helper method
    - increment stars by 2
- PRINT the bottom half of diamond
  - LOOP while stars >= 1
    - decrement stars by 2
    - PRINT the line of stars *

PRINT line of stars
- given n and stars
- PRINT stars centered in a line of n length
  - padding is whitespace
=end

def print_line(grid_size, stars)
  puts ("*" * stars).center(grid_size)
end

def diamond1(grid_size)
  stars = 1

  loop do
    print_line(grid_size, stars)
    break if stars == grid_size
    stars += 2
  end

  loop do
    break if stars == 1
    stars -= 2
    print_line(grid_size, stars)
  end
end

def diamond2(grid_size)
  stars = 1

  while stars <= grid_size
    print_line(grid_size, stars)
    stars += 2
  end

  stars -= 2

  while stars > 1
    stars -= 2
    print_line(grid_size, stars)
  end
end

def diamond(grid_size)

  (1..grid_size).step(2) do |stars|
    print_line(grid_size, stars)
  end

  (grid_size - 2).step(0, -2) do |stars|
    print_line(grid_size, stars)
  end
end

# diamond(1)
# diamond(3)
diamond(9)

# TIME: 14:22


=begin
# LS Solution
- DETERMINE maximum distance from center row of diamond, aka how many rows are in each top/bottom half
  - DIVIDE grid_size by 2, set to 
=end


def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond2(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end


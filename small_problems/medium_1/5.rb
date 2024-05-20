=begin

PROBLEM
Given an integer, n, write a method that displays a 4-pointed diamond in a grid of size n * n. 
- n is an odd integer
- make the diamond out of * characters

Input: integer (odd)
Output: print diamond in integer x integer size grid

Rules:
- argument is always an odd integer
- grid is n * n big
- diamond shape is 

 *
***
 *

- middle of diamond has n asterisk
- each row above/below has n-1 asterisk, centered
- rows are mixes of whitespace + *
- each line increases/decreases by 2 * chars

EXAMPLES:
diamond(1)

* 

diamond(3)
 *
***
 *
length: 3
asterik: 1
whitespace: 2

asterik: 3
whitespace: 0

asterik: 1
whitespace: 2

countdown, countup


diamond(9)
    * asterik: 1; whitespace: 8
   ***
  *****
 *******
********* asterik: 9; whitespace: 0
 *******
  *****
   ***
    * asterik: 1; whitespace 8









ALGORITHM:
- given an integer n
- a line is n characters long
- SET asterisk to 1
- start a loop, iterate while asterisk <= n
  - print a line that is total n chars in length
    - middle char is *
    - rest of chars are whitespace
  - increment asterisk by 2
- start another loop, iterate while asterisk > 1
  - print a line that is total n chars in length
  - center asterik chars surrounded by whitespace
  - decrement asterisk by 2

=end

# def diamond(n)
#   asterisk = 1

#   while asterisk < n
#     puts ("*" * asterisk).center(n)
#     asterisk += 2
#   end

#   puts ("*" * asterisk).center(n)

#   while asterisk > 1
#     asterisk -= 2
#     puts ("*" * asterisk).center(n)
#   end
# end

def print_row(asterisks, grid_size)
  puts asterisks.center(grid_size)
end

# Refactor
def diamond(n)
  asterisk = 1

  while asterisk <= n
    print_row(("*" * asterisk), n)
    asterisk += 2
  end

  while asterisk > 1
    asterisk -= 2
    print_row(("*" * asterisk), n)
  end
end

# LS Solution
# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   p number_of_stars
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

# diamond(1)
# diamond(3)
diamond(9)
#diamond(27)

# TIME: 21:10
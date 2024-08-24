=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

PROBLEM:
Given a integer, print a right triangle. Each side has integer number of stars. The hypotenuse (diagonal side) should start in lower-left of triangle, end in upper-right triangle

RULES:
- triangle is built on a grid of n x n size
- top row has 1 star, right-aligned
- bottom row has 5 stars

Examples:

triangle(5)
    *
   **
  ***
 ****
*****

triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

DATA STRUCTURES:
Input: Integer

Output: printed triangle

BRAINSTORM:
needs:
  - a way to iterate n times in order to print each line of triangle

ALGORITHM:
- Given an integer, n
- SET stars to 1
- LOOP n times
  - on each iteration, 
  - print "*" * stars number, right-aligned on a line that is n size
  - increment stars by 1
=end

def triangle1(n)
  stars = 1

  n.times do
    puts ("*" * stars).rjust(n)
    stars += 1
  end
end


# alt way, without rjust
=begin
Given an integer, n
- SET stars to 1
- SET spaces to n - stars
- LOOP n times
  - on each iteration,
  - PRINT a line that concatenates ' ' * spaces + "*" * stars
  - increment stars by 1
  - decrement spaces by 1
=end

def triangle(n)
  stars = 1
  spaces = n - 1

  n.times do 
    puts (" " * spaces) + ("*" * stars)
    stars += 1
    spaces -= 1
  end
end

triangle(5)
triangle(9)

# TIME: 4:00
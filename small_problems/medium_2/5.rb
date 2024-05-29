=begin

Valid Triangle:
- sum of lengths of two shortest sides must be grater than length of longest side
- all sides length must be > 0
- otherwise, invalid:

TRIANGLE TYPES:
- Equilateral: 3 sides equal length
- Isosceles - 2 sides equal, 3rd different
- Scalene - 3 sides different


DATA STRUCTURE:
Input: 3 integers (sides of triangles)

array of triangle lengths
can sort and compare 

Output: symbol of triangle type (or invalid)

ALGORITHM:
given three integers,

- place 3 sides in an array, "sides"
- First, validate the triangle * helper
  - check if array contains any 0 values 
    - if true: return false
  - given an array of 3 integers
    - sum 2 smallest integers
    - check if sum is > largest integer
      - if true: return true
      - if false: return false
  - If triangle invalid, return :invalid

- Check if sides array contains all the same integer
  - if true: return :equilateral
- Check if sides array contains 2 of the same integer
  - if true: return :isosceles
- otherwise, return :scalene

=end

# def valid_triangle?(sides)
#   return false if sides.include?(0)
#   sides = sides.sort
#   sides[0] + sides[1] > sides[2]
# end

# refactored
def valid_triangle?(sides)
  sides = sides.sort
  sides[0] + sides[1] > sides[2]
end

def triangle(side_a, side_b, side_c)
  sides = [side_a, side_b, side_c]
  return :invalid if !valid_triangle?(sides)

  if sides.count(sides[0]) == 3
    :equilateral
  elsif sides.any? { |int| sides.count(int) >= 2 }
    :isosceles
  else
    :scalene
  end
end

# LS Solution
  # gets max side
  # compares sum of all side lengths to 2 * max side length
  # 3, 4, 5
  # 5 > (3 + 4 + 5) - 5 => 5 > 7?
  # aka: largest_side > sides.sum - largest_side -- this is checking if a triangle's largest side is greater than the sum of its two smaller sides, the triangle is invalid.
# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_size = sides.max

#   case
#   when 2 * largest_side >= sides.reduce(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end

# Student solution - Checks for number of unique side lengths with case statement
def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid if sides[0, 2].sum <= sides[2]
  case sides.uniq.size # number of unique elements
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid


# TIME: 12:30
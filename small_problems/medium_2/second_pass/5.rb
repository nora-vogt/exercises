=begin
A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

PROBLEM:
Given three side lengths, determine what type of triangle the lengths form. (can be invalid)

RULES:
- valid triangle: 
  1. sum of 2 shortest sides must be greater than longest side
  2. all sides must have lengths greater than 0
- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length

EXAMPLES:

p triangle(3, 3, 3) == :equilateral -- 3 same
p triangle(3, 3, 1.5) == :isosceles -- 2 same



p triangle(3, 4, 5) == :scalene -- all diff
p triangle(0, 3, 3) == :invalid -- one side length not greater than 0
p triangle(3, 1, 1) == :invalid -- sum of two shortest sides is not greater than longest side

DATA STRUCTURES:
Input: 3 integers (sides)

array of side lengths

Output: symbol of triangle type or invalid

ALGORITHM:
Given three integer side lengths,
- IF triangle is not valid, RETURN :invalid
- IF side a == side b && side b == side c, RETURN :equilateral
- OTHERWISE if side a == side b OR side b == side c, RETURN :isosceles
- OTHERWISE return scalene


DETERMINE if triangle is invalid:
- given 3 side lengths in an array
- return a boolean
- return false if any side is 0
- return false if smallest two summed is not greater than largest
- otherwise return true
=end

def valid_triangle?(sides)
  return false if sides.any?(0)

  two_smallest_sides = sides.min(2)
  largest_side = sides.max

  two_smallest_sides.sum > largest_side
  # largest_side > sides.reduce(:+) - largest_side
end

def triangle1(side1, side2, side3)
  return :invalid unless valid_triangle?([side1, side2, side3])

  if side1 == side2 && side2 == side3    then :equilateral
  elsif side1 == side2 || side2 == side3 then :isosceles
  else                                        :scalene
  end
end

=begin
# Another student solution

# Think of the triangle as looking for the number of unique sides
# Also, don't need to specifically check for a zero side. If any side is 0, think of a sorted array. It's not possible for two smallest sides to sum to more than the largest element.
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  return :invalid if sides[0, 2].sum <= sides[2]
  # must be <= [0, 3, 3] is not valid

  case sides.uniq.size
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

# Time: 10:37
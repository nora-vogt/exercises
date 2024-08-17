=begin
Tri-Angles

A triangle is classified as follows:

    right One angle of the triangle is a right angle (90 degrees)
    acute All 3 angles of the triangle are less than 90 degrees
    obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

PROBLEM:
Given three integers (degrees) of triangle sides, determine what type of triangle it is (or invalid).

RULES:
    right One angle of the triangle is a right angle (90 degrees)
    acute All 3 angles of the triangle are less than 90 degrees
    obtuse One angle is greater than 90 degrees.
- all angles must sum to 180
- all angles must be greater than 0
- all angles will be integers
- all angles are specified in degrees

EXAMPLES:
triangle(60, 70, 50) == :acute -- all 3 less than 90
triangle(30, 90, 60) == :right -- 1 is 90
triangle(120, 50, 10) == :obtuse -- 1 greater than 90
triangle(0, 90, 90) == :invalid -- one side is 0
triangle(50, 50, 50) == :invalid -- does not sum to 180

DATA STRUCTURES:
Input: three integers (degree of triangle sides)

array of angles

Output: type of triangle as symbol or :invalid

ALGORITHM:
Given three integer angles, 
- IF any angle is 0, return :invalid
- IF all angles don't sum to 180, return :invalid
- IF any angle > 90, return :obtuse
- IF one angle IS 90, return :right
- IF all angles < 90, return :acute
=end

def triangle1(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.any?(0) || angles.sum != 180

  if angles.any? { |angle| angle > 90}    then :obtuse
  elsif angles.any?(90)                   then :right
  elsif angles.all? { |angle| angle < 90} then :acute
  end
end

=begin
# LS solution - use a case statement without a condition
=end

def triangle2(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.sum != 180 || angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

=begin
Clever student solution:
- helper method to determine if triangle is invalid
- case statement: compare the largest angle to 90 with <=>
  - if the largest angle is 90, <=> returns 0, meaning the values ar the same. thus, triangle is :right
    (can't have another angle that is also 90, otherwise the third angle would have to be 0)
  - if <=> returns 1, then the largest angle is greater than 90 -> obtuse
  - otherwise, acute (<=> would return -1, largest angle is less than 90)
=end

def invalid_triangle?(angles)
  angles.any?(0) || angles.sum != 180 || angles.size != 3
end

def triangle3(*angles)
  return :invalid if invalid_triangle?(angles)

  case angles.max <=> 90
  when 0 then :right
  when 1 then :obtuse
  else        :acute
  end
end

# Or can just check on largest angle in a different way

def triangle(*angles)
  return :invalid if invalid_triangle?(angles)

  case angles.max
  when 90   then :right
  when 91.. then :obtuse
  else           :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


# TIME: 6 or 8 mins
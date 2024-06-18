=begin
A triangle is classified as follows:

    right One angle of the triangle is a right angle (90 degrees)
    acute All 3 angles of the triangle are less than 90 degrees
    obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Input: three integers (triangle angles)
Output: symbol (triangle type or invalid)

RULES:
- all angles must add up to 180
- all angles must be greater than 0
- one angle 90 - :right
- three angles less than 90 - :acute
- one angle greater than 90 - :obtuse
- otherwise, :invalid
- args will be integers specified in degrees

DATA STRUCTURES:

ALGORITHM:

*validate triangle helper method*
- check if three angles sum equals 180
  - return false if not
- check if any angle is 0
  - return false if true

- return :invalid if triangle not valid

- check angles
  - if one angle == 90, return :right
  - if one angle > 90, return :obtuse
  - else, return :acute
=end

def valid_triangle?(angles)
  angles.sum == 180 && angles.all? { |angle| angle > 0 }
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless valid_triangle?(angles)

  case
  when angles.all? { |angle| angle < 90 } then :acute
  when angles.any? { |angle| angle > 90 } then :obtuse
  else                                         :right
  end
end

# LS SOLUTION
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0) then :invalid
  when angles.include?(90)                          then :right
  when angles.all? { |angle| angle < 90 }           then :acute
  else                                                   :obtuse  
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# TIME: 13:00
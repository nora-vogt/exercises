=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.


PROBLEM:
- Create a program that can determine if a triangle is equilateral, isosceles, or scalene.

RULES:
- Equilateral: all 3 sides are same length
- Isosceles: exactly 2 sides are same length
- Scalene: no sides are same length (all sides are diff length)
- To be valid triangle: 
  - All sides must be of length > 0
  - The sum of any 2 sides must be > the length of the third side


EXAMPLES/TEST CASES:
- Need a Triangle class
- Need Initialize that takes 3 integer args
- Need a @kind attribute that references a string: equilateral, isosceles, scalene
  - Need a @kind getter
- Triangle can be "Small" - made with floats
- Passing 0 as side lengths raises an ArgumentError
- Cannot have negative side lengths
- Cannot create triangle if size inequality (sum of 2 sides is not greater than length of third side)

- The triangle does not get created if its invalid

DATA STRUCTURES:
- Triangle instances - accept 3 integer arguments

initialize:
- sides = array of 3 int args
- @kind = string

valid triangle?

ALGORITHM:

Creating a new Triangle instance
- Define an initialize method that takes 3 integer arguments
  - Add args to an array called 'sides'
  - Check if the triangle is valid - valid?
    - if not valid, raise an error
    - if valid, continue
  - set @kind to return value of - determine_kind
  - create the instance


Validate triangle sides - valid?
- raise error if any side length <= 0
- raise error if side inequality
  - Side inequality: the sum of any 2 sides must be greater than the length of the third side

Determine kind of triangle - determine_kind
- method returns a string
- use conditional - call each helper method and return string accordingly
equilateral?

isosceles?

scalene?
=end

# Original Solution
class Triangle
  attr_reader :kind

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError, 'Invalid triangle!' if invalid?
    @kind = determine_kind
  end

  def side_inequality?
    side1, side2, side3 = @sides
    (side1 + side2 <= side3) || (side1 + side3 <= side2) || (side2 + side3 <= side1)
  end

  def invalid_side?
    @sides.any? { |side| side <= 0 }
  end

  def invalid?
    side_inequality? || invalid_side?
  end

  def equilateral?
    @sides.all? { |length| length == @sides[0] }
  end

  def isosceles?
    @sides.any? { |length| @sides.count(length) == 2 }
  end

  def scalene?
    @sides.uniq == @sides
  end

  def determine_kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    elsif scalene?
      'scalene'
    end
  end
end

# Refactor according to LS solution - Don't set @kind, just have an instance method #kind
class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid side lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end
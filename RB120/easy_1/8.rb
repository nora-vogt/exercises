=begin
# 
Rectangles and Squares

Given the following class, write a class called Square that inherits from Rectangle, and is used like this:
=end

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side_length)
    super(side_length, side_length)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"

=begin
We need to define the class, `Square`, and have it inherit from `Rectangle` using the `<` symbol. `Square` is initialized with just one value, while `Rectangle#initialize` takes two arguments - height and width. To account for this, in `Square#initialize` we invoke the `super` method, which invokes `Rectangle#initialize`. We pass it two arguments - the given `side_length` twice, because the same value will be used for both the height and width to make a `Square.`

This successfully assigns the value passed to `Square::new` on line 25 to the instance variables `@height` and `@width`, allowing us to calculate the area on line 26 - because `Square` has access to the `area` method from `Rectangle.`
=end
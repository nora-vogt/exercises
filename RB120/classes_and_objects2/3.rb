=begin
# Identify Yourself (Part 1)
Using the following code, add a method named #identify that returns its calling object.

Within an instance method definition scope, `self` refers to the current instance. So, `self` will return the object (instance) that is invoking the `identify` method.

Notes:
- `self` refers to the calling object
- `#p` calls `inspect` on its argument and outputs the result.
- When we output an object, we also see its attributes (its instance variables)
=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
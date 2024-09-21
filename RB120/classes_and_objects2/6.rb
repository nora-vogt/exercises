=begin
# Colorful Cat

Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the name and color of the cat. Use a constant to define the color.

- Initialize a constant, using all uppercase letters for variable name
  - Constants are available throughout the class and instances of the class
- Use `attr_reader` to create a getter method for `@name`
- Define the instance method, interpolate desired values.
=end

class Cat
  COLOR = 'purple'    # constants at the top, before attr_* methods

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} #{self.class}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet  # outputs: Hello! My name is Sophie and I'm a purple Cat!

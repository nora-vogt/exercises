=begin
Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.

There are two ways to add a setter method:
  1. Manually define the method
  2. Use the `attr_writer` method

In this case, since we want to both read and change the `@name` attribute, we can also use the `attr_accessor` method to create a setter/getter, passing the instance variable's name as a symbol.
=end

class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end
  
  # alternative - manually define the setter
  def name=(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
=begin
Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

`attr_accessor` is the method that will create setter/getter methods for the specified instance variable, whose name is passed to the method as a symbol.
  - setter is `name=`
  - getter is `name`
=end

class Cat
  attr_accessor :name

  def initialize(name)
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
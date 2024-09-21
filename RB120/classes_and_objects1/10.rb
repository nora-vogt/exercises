=begin
Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.

Modules are used to define behavior (methods) that can be shared between non-related classes (aka, classes that don't make sense to use inheritance with). Including a module in a class is called mixing in a module. Here, `include` is used to mix the `Walkable` module into the `Cat` class.
=end

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk
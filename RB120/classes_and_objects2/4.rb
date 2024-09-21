=begin
# Generic Greeting (Part 2)

Using the following code, add two methods: ::generic_greeting and #personal_greeting. The first method should be a class method and print a greeting that's generic to the class. The second method should be an instance method and print a greeting that's custom to the object.

- Define a class method using the `self` syntax.
- Define an instance method, and within the method definition, interpolate the return value of the getter `name` into the string to be output.
- For fun, we also will use `self` within the instance method to call the `#class` method, in order to share the class of the instance as part of our greeting.

Notes:
- Within class methods, we're can't access any data associated with the objects of the class themselves (their attributes/instance variables).
- Class methods are generic actions that the class itself can perform.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def self.speak # all cats meow, so makes sense for this to be a class method
    puts "Meow!"
  end

  def personal_greeting
    puts "Hello! I'm a #{self.class} and my name is #{name}!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
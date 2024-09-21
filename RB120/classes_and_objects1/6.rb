=begin
Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

Expected output: Hello! My name is Sophie!

Instance methods are defined within a class by using the reserved word `def` and supplying the method's name. Any instance of the `Cat` class can invoke a public instance method. Instance variables, once initialized, are accessible within any of the class' instance method definitions. Here, `greet` is an instance method invoked by `kitty`, and it references the `@name` variable, interpolating the value in the string that is output by `puts`.

Notes:
- Instance methods are only available when there is an instance of the class to call them.
=end

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

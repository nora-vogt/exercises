=begin
Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

Notes:
- Instance variable only exist within an object instance
- They can only be referenced once the object has been initialized

We can initialize an instance variable by prepending `@` to the variable name. Here, we are assigning the value passed in as an argument to the `::new` method to the instance varible `@name`.
=end

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
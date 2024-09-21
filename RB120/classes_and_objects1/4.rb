=begin
Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is instantiated.

When a new object of a class is instantiated using the `::new` method, the `::new` method automatically invokes the class's `initialize` method. We can use `initialize` to start defining attributes for the object, or in this case, outputting a message.
=end

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

ruby = Cat.new  # prints: I'm a cat!
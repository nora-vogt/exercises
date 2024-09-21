=begin
Modify the following code so that Hello! I'm a cat! is printed when `Cat.generic_greeting` is invoked.

This exercise is asking us to define a class method - which is a method that can be called by the class itself. To define a class method, we use the reserved word `def` and prepend `self.` to the name of the method. In this scope, `self` references the class itself.

The class method can be invoked using either syntax:
- Cat.generic_greeting
- Cat::generic_greeting

Trying to invoke a class method on an instance of the class raises a `NoMethodError`.

# Further Exploration:
What happens if you run kitty.class.generic_greeting? Can you explain this result?

`kitty.class` is invoking the `Kernel#class` method on `kitty`. `Kernel#class` returns the class of the calling object. `kitty` is an instance of `Cat`, so `#class` returns `Cat`. `Cat` then calls the class method `::generic_greeting`, resulting in the string being printed.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def Cat.meow # This syntax can also be used to define a class method, but `self` is preferred.
    puts "Meow"
  end
end

Cat.generic_greeting
Cat::meow
kitty = Cat.new
# kitty.generic_greeting # => undefined method `generic_greeting' for #<Cat:0x0000000109de6cc8> (NoMethodError)
kitty.class.generic_greeting # Outputs: Hello! I'm a Cat!

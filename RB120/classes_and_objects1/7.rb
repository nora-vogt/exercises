=begin
Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

Getter methods are defined using `def` and supplying the name of the instance variable as the method name (in this case, `name`). Getter methods simply return the value of an instance variable.

After defining the `name` getter method, we simply change the interpolate the return value of invoking the `name` method within the `greet` method definition, rather than directly referencing `@name`.

We can also define a getter method by using the `attr_reader` method and supplying the name of an instance variable as a symbol.
=end 

class Cat
  # attr_reader :name   # an alternative

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
p kitty.name
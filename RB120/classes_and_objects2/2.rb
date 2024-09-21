=begin
Using the following code, add an instance method named #rename that renames kitty when invoked.

We define `rename` as an instance method, with one parameter, `new_name`. Within the method definition, we call the `#name=` setter method that was created by the `attr_accessor` method on line 8. We pass `new_name` to `#name=`, and the setter method reassigns the value of `@name` to `new_name`.

Note: We must use the `self.name=` syntax to tell Ruby that we want to invoke the setter method. Otherwise, if we write `name = new_name`, Ruby will just create a local variable called `name` and assign it to `new_name`.
=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end

  def test
    name = "incorrect name"
    name # this is a reference to the local variable `name`, not an invocation of the getter method `name`. When there is a local var and a method with the same name, Ruby will check for the local var first.
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
p kitty.test
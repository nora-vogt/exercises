=begin
# Public Secret
Using the following code, create a class named Person with an instance variable named @secret. Use a setter method to add a value to @secret, then use a getter method to print @secret.

We have two options:
  1. use the `attr_accessor` method to create @secret, and its setter/getter methods
  2. Manually define the setters/getters

Notes:
- Instance methods are public by default
- Public methods can be accessed within the class and outside the class.
- We don't need an `initialize` method, because we aren't creating a `@secret` for an instance of `Person` upon instantiation. We're adding it later.
=end

# Option 1
class Person
  attr_accessor :secret
end

# Option 2
class Person
  def secret=(secret)
    @secret = secret
  end

  def secret
    @secret
  end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret  # Output: Shh.. this is a secret!
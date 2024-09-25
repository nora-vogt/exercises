class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

=begin
# Buggy Code - Car Mileage

The code as currently written is not properly incrementing the car's mileage when `increment_mileage` is invoked. This is due to line 10. Instead of reassigning `@mileage` - the instance variable that keeps track of the car's current mileage, line 10 creates a local variable called `mileage` and assigns it to the value of `total`. We simply need to swap the local variable for our instance variable, `@mileage`. Or, because we already have a setter method for `@mileage` due to the `attr_accessor` method, we can invoke the `mileage=` method on line 10 with the `self` syntax.

Fix the above code so it works properly.
=end

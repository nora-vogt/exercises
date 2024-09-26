=begin
# Fix the Program - Drivable

Correct the following program so it will work properly. Assume that the Car class has a complete implementation; just make the smallest possible change to ensure that cars have access to the drive method.

Remove the `self.` from the `drive` method definition. `self.drive` is a class method that will not be available to instances of the `Car`` class.
=end

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
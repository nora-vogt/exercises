=begin
# Refactoring Vehicles

Consider the following classes, and refactor these classes so they all use a common superclass, and inherit behavior as needed.
=end

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

car = Car.new("Subaru", "Crosstrek")
motorcycle = Motorcycle.new("Moto Guzzi", "Le Mans")
truck = Truck.new("Toyota", "Tacoma", 2000)
p car
p motorcycle
p truck

=begin
Further Exploration

Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?

It doesn't make sense to define a `wheels` method in `Vehicle`, because we may have vehicles that don't have wheels, like a boat, snowmobile, or helicopter.

If a vehicle's wheels are an important part of the program, we could create a `WheeledVehicle` class that inherits from `Vehicle`, define `wheels` there (default to 4, because many vehicles have four wheels), and make our classes inherit from `WheeledVehicle` instead.
=end
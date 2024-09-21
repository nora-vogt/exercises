=begin
# Transportation

Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

This is an example of using modules for namespacing - grouping related classes within a module. 
  - This makes it easier to recognize the purpose of the contained clases
  - Also help avoid collision with classes of the same name.
=end

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

# Instantiate an object from a class that is contained in a module:

Transportation::Truck.new
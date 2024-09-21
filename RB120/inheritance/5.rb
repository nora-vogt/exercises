=begin
# Towable (Part 1)

Using the following code, create a Towable module that contains a method named tow that prints I can tow a trailer! when invoked. Include the module in the Truck class.

Define the module with the `module` keyword, and then mix the module into the `Truck` class with `include`.
=end

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow
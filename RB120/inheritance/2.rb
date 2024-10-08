=begin
# Start the Engine (Part 1)

Change the following code so that creating a new Truck automatically invokes #start_engine.
=end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    puts 'Ready to go!'
  end
end

class Truck < Vehicle
  def initialize(year)
    super              # super will invoke the `Vehicle#initialize`` method and pass `year`
    start_engine
  end
end

truck1 = Truck.new(1994)
puts truck1.year
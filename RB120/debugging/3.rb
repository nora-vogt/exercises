class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end

  # alt
  # def ==(other)
  #   self.to_s == other.to_s
  # end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

=begin
On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates. So why does line 39 output false? Fix the code to produce the expected output.

Line 39 outputs `false` because we have not overridden the `#==` method in our `GeoLocation` clas. Right now, this method is checking of `grace.location` and `ada.location` reference the same single `GeoLocation` object. They do not: each `Person`'s location references a unique `GeoLocation` instance. Even though each `GeoLocation` has the same `latitude` and `longitude` values, they are two unique instances, so `==` returns false. 

To fix this, we want to define `==` in our `GeoLocation` class, so that our equality comparison will compare the `latitude` and `longitude` values, rather than the `GeoLocation` objects themselves.

# Key language from solution:
- Remember to say, there is no `#==` method defined in our `GeoLocation` class, so Ruby will look up the method lookup path, invoking `BasicObject#==`, which checks if the two objects being compared are literally the same object -- meaning they have the same object id.
- We need to override `#==` in GeoLocation, to compare the attributes of two objects, rather than the objects themselves.
=end
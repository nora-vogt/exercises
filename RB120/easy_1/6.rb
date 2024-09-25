=begin
# Fix the Program - Flight Data

Consider the following class definition:
=end

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

The class is defined with an `attr_accessor` method, which provides both a setter and a getter for @database_handle. This allows for reassigning the value of @database_handle from outside of the class to another Database, which could cause problems for the program. We should change `attr_accessor` to `attr_reader`, allowing us to only get the value of `@database_handle`.

If we need the functionality to associate a `Flight` with a different `Database` at a later time, then we should consider making the `@database_handle` a private method. We can do the same for the getter, if we do not want the database information to be publicly available in our program.
=end
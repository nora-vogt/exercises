=begin
# Access Denied

Modify the following code so that the value of @phone_number can still be read as on line 10 (16 here), but cannot be changed as on line 12 (18).

# this code lets us set the value of @phone_number when instantiating the object, retrieve the value of @phone_number outside the class, but it does NOT let us change the value of @phone_number from outside the class (no setter).
=end

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number # 1234567899

person1.phone_number = 9987654321
puts person1.phone_number # NoMethodError
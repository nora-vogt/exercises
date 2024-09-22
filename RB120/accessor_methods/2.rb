=begin
# Choose the Right Method

Add the appropriate accessor methods to the following code.
=end

class Person
  attr_accessor :name
  attr_writer :phone_number
end

# OR
class Person
  attr_writer :name, :phone_number
  attr_reader :name
end

# OR
class Person
  def name=(name)
    @name = name
  end
  
  def name
    @name
  end

  def phone_number=(phone_number)
    @phone_number = phone_number
  end
end

person1 = Person.new
person1.name = 'Jessica'  # setter
person1.phone_number = '0123456789'  # setter
puts person1.name  # getter
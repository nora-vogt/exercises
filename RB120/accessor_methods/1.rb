=begin
# Reading and Writing

Add the appropriate accessor methods to the following code.
=end

class Person
  attr_accessor :name
end

# Or
class Person
  attr_reader :name
  attr_writer :name
end

# Or
class person
  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

person1 = Person.new
person1.name = 'Jessica'  # setter
# No syntactical sugar: person.name=('Jessica')
puts person1.name         # getter
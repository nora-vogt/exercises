=begin
# Who is Older?

Using the following code, add the appropriate accessor methods. Keep in mind that @age should only be visible to instances of Person.

- age getter should be protected - all instances of Person can call it within the class.
- age setter should be public
=end

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
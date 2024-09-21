=begin
# Protected Secret
Using the following code, add an instance method named compare_secret that compares the value of @secret from person1 with the value of @secret from person2.

Unlike `private` methods, `protected` methods can be called within the class both by the current instance and other instances of the class. `protected` method still cannot be called outside of the class.

Notes:
- Protected methods allow access between class instances, while private methods don't.
=end

class Person
  attr_writer :secret

  # def compare_secret(other_person)
  #   puts "#{self}'s secret is #{self.secret}, whereas #{other_person}'s secret is #{other_person.secret}!"
  # end

  def compare_secret(other_person)
    self.secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)  # false

person1.secret # protected method `secret' called for #<Person:0x0000000105cd4f78 @secret="Shh.. this is a secret!"> (NoMethodError)
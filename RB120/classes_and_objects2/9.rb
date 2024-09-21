=begin
# Private Secret
Using the following code, add a method named share_secret that prints the value of @secret when invoked.

The `@secret` getter is defined as a private method. Due to updates in a prior version of Ruby, there are two ways we can access the getter method:
  1. Define a public method and call the getter
  2. Define a public method and call the getter with `self` - this is now allowed, but we can't directly invoke `secret` with another instance of `Person` within the class. Only the current instance.

Notes:
- Private methods are useful when you don't want an instance method to be called outside the class in the public interface.
=end

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  def reveal_someones_secret(other_person)  # Trying to invoke this method will raise an error.
    puts "Another person's secret is #{other_person.secret}!"
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret  # Output: Shh.. this is a secret!
person2 = Person.new
person2.secret = "Don't tell my secret." 

person1.secret # private method `secret' called for #<Person:0x0000000108de4d48 @secret="Shh.. this is a secret!"> (NoMethodError)
  # Private methods can't be called outside of the class.

person1.reveal_someones_secret(person2) # private method `secret' called for #<Person:0x0000000105106840 @secret="Don't tell my secret."> (NoMethodError)
  # Even though we aren't directly invoking the private `secret` method outside of the class, `reveal_someones_secret` attempts to invoke `secret` using the `Person` that is passed in as an argument. This isn't allowed with `private` methods.
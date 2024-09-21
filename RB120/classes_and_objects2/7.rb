=begin
# Identify Yourself (Part 2)
Update the following code so that it prints I'm Sophie! when it invokes `puts kitty`.

To accomplish this, we need to make a custom `#to_s` method for instances of the `Cat` class. `#puts` automatically calls `#to_s` on its argument before printing the result. As curently written, the Cat object will be output. We need to define a `#to_s`instance method, and have that method output the cat's name.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty
=begin
# Counting Cats
Using the following code, create a class named Cat that tracks the number of times a new Cat object is instantiated. The total number of Cat instances should be printed when ::total is invoked.

The class should track the number instances that have been created, and to do this, a class variable can be used. Class variables have `@@` prepended to the variable name. We can then increment the value of that variable each time the `initialize` method is invoked, and print the output in the class method `::total`.
=end
class Cat
  @@number_of_cats = 0

  def initialize
    @@number_of_cats += 1
  end

  def self.total
    puts "There are currently #{@@number_of_cats} cats."
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
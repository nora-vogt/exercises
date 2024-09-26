=begin
# Moving

You have the following classes.
Modify the code so this works:
mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
You are only allowed to write one new method to do this.
=end
module Walkable
  def walk
    puts "#{name} #{gait} forward."
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

=begin
We have three different classes, not related to each other, but they all share a polymorphic behavior: walking. We can implement polymorphism through inheritance by mixing in the `Walkable` module to each class. `Walkable` will contain a `walk` method that uses the `name` and `gait` of each instance to ambulate.

Person, Cat, and Cheetah all "have" (has-a) the ability to walk, so we use the Walkable module.

To use class inheritance, we could make an `Animal` superclass (because `Person` is an `Animal` too), and make our classes inherit from the superclass.
=end
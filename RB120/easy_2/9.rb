=begin
# Nobility
Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:
byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other purposes that we aren't showing here.

Option 1A - my solution: Override the `walk` method in the `Noble` class, interpolate the title in a string, and use `super` to invoke the `walk` method from `Walkable`. (Essentially prepends the title to the `walk` output.)

Option 1B - This could be further simplified by having Noble inherit from Person (a Noble is a Person)

Option 2 - LS Solution - use #to_s

Option 3 - FE - Use class inheritance - eliminate repetitive #to_s
=end
# Option 1A
# module Walkable
#   def walk
#     "#{name} #{gait} forward."
#   end
# end

# class Noble
#   include Walkable

#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def walk
#     "#{title} #{super}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# class Person
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# Option 1B
# module Walkable
#   def walk
#     "#{name} #{gait} forward."
#   end
# end

# class Person
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Noble < Person
#   attr_reader :title

#   def initialize(name, title)
#     super(name)
#     @title = title
#   end

#   def walk
#     "#{title} #{super}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# Option 2 - LS Solution
# Within `Walkable#walk`, interpolate the calling instance with `self`. Ruby automatically calls #to_s on the instance. (`"#{self}"` is actually `"#{self.to_s}"`) Within each class, override #to_s to return the instance's `name`, or in the case of `Noble`, `title` + `name`.

# module Walkable
#   def walk
#     "#{self} #{gait} forward."
#   end
# end

# class Noble
#   include Walkable

#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def to_s
#     "#{title} #{name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# class Person
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

=begin
Further Exploration

This exercise can be solved in a similar manner by using inheritance; a Noble is a Person, and a Cheetah is a Cat, and both Persons and Cats are Animals. What changes would you need to make to this program to establish these relationships and eliminate the two duplicated #to_s methods?

Is to_s the best way to provide the name and title functionality we needed for this exercise? Might it be better to create either a different name method (or say a new full_name method) that automatically accesses @title and @name? There are tradeoffs with each choice -- they are worth considering.
=end

# Option 3 - Using `Animal` as a superclass, keeping the `self` in `walk` and `#to_s`. Move `#to_s` to `Animal`, and override `#to_s` in `Noble` to add the title too.
# module Walkable
#   def walk
#     "#{self} #{gait} forward."
#   end
# end

# class Animal
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end
# end

# class Person < Animal
#   private

#   def gait
#     "strolls"
#   end
# end

# class Noble < Person
#   attr_reader :title

#   def initialize(name, title)
#     super(name)
#     @title = title
#   end

#   def to_s
#     "#{title} #{name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# class Cat < Animal
#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah < Cat
#   private

#   def gait
#     "runs"
#   end
# end

# Option 4 - LS - Use a `full_name` method in `walk` instead of `self`. This removes the necessity of overriding `#to_s`. I think this is more readable, as it's not immediately obvious what `self` in `walk` will return.
module Walkable
  def walk
    "#{full_name} #{gait} forward."
  end
end

class Animal
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def full_name
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"
puts byron.name
# => "Byron"
puts byron.title
# => "Lord"


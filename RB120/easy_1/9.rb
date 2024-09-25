=begin
# Complete the Program - Cats!

Consider the following program, Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
=end

class Pet
  attr_reader :name, :age # We could also directly access the instance variables in `Cat#to_s`, instead of defining a `attr_reader` here.

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :colors

  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
# Further Exploration

An alternative approach to this problem would be to modify the Pet class to accept a colors parameter. If we did this, we wouldn't need to supply an initialize method for Cat.

Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying Pet?

1. Why would we be able to omit the initialize method? 
If we changed `Pet#initialize` to accept a colors parameter and deleted the `#initialize` method from `Cat`, then `Cat::new` would automatically invoke the `Pet#initialize` method becaue `Cat` inherits from `Pet`. This is due to Ruby's method lookup chain. Ruby will first look in `Cat` for initialize, and then when it doesn't find the method, it will look in `Pet` - the next class on the inheritance hierarchy. 

2. Would it be a good idea to modify Pet in this way? Why or why not?
It depends on how we would like our program to work. We may have other pets that only have a single color, rather than `@colors`, or maybe we have some pets where we don't care about their color. If we wanted to prevent potential problems, we could make the colors parameter optional, set it to a default value of `nil`, and only initialize `@colors` if a value is supplied.

Amazing answer from Bob:


Further exploration: a subclass needs to provide its own #initialize method if it needs to initialize state differently from its superclass. In the last lesson, Square didn't need two sides, so its #initialize method accepted only one parameter and passed it to both parameters in the superclass. Here, if you add a color attribute to Pet, then Cat and Pet will initialize the state in the same way. So, you don't need an additional #initialize method for Cat.

I wouldn't be quick to add a color attribute to Pet, though (although I might be quicker than I would be to add wingspan to Pet instead of making it a part of a Bird class). A pet raccoon, for example, is going to be, well, raccoon-colored. The point about superclasses is that they model state and behavior that is common to all (or at least most) subclasses. So if most pets have a meaningful color value, then fine, put color in Pet. If not, then find another solution.

One alternative is to put color in every subclass of pets that varies in color. Dogs, cats, birds, guinea pigs, and bears, but not raccoons, rattlesnakes, pythons, alligators, iguanas or cheetahs. If you are trying to model a menagerie of that level of variety, it would probably make sense to have some sort of ColoredPet class and have pets that need a color attribute derive from that, so you could keep the implementation of the attribute in one place.

As a further thought experiment along these lines, suppose we wanted to generalize an Animal class from our Pet class. We could ask ourselves what attributes are common to animals, whether they are pets or not. From that, we might decide that all animals have an age, so age might move up to Animal. But we only name our pets, so name would stay with Pet.

The basic idea when coming up with an inheritance hierarchy is to generalize common state and behaviors into superclasses, and specialize into subclasses any state and behavior that is specific to only a subset of members of a class.
=end
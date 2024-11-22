# The code below raises an exception. Examine the error message and alter the code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
When attempting to initialize a new `SongBird` on line 52, an `ArgumentError` will be raised. `SongBird#initialize` calls `super` on line 39 with no parentheses, which means that all three arguments passed into the method will be passed to the superclass, `Animal#initialize` method. To fix this, we need to invoke `super` on line 39 like this: `super(diet, superpower)` so the correct number of argumetns will be passed to `Animal#initialize`.

Further Exploration

Is the FlightlessBird#initialize method necessary? Why or why not?
No, it is not necessary. `FlightlessBird#initialize` simply calls `super`, which will invoke `Animal#initialize`, which accepts two arguments - `diet` and `superpower`. We can remove this method and the code will still function in the same way. 

# Note from Bob Rodes: Further exploration: FlightlessBird doesn't need an initialize method. The only reason to have one is if the class has to do something different from its superclass when it gets instantiated. 
=end
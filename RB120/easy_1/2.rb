# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s # String#to_s returns `self`, NOT a new String object.
#   end

#   def to_s
#     @name.upcase!
#     "My name is #{@name}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name  # Fluffy
# puts fluffy # My name is FLUFFY.
# puts fluffy.name # FLUFFY
# puts name # FLUFFY

=begin
# What's the Output?

Take a look at the following code. What output does this code print? Think about any undesirable effects occurring due to the invocation on line 17. Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

On line 15, a new `Pet` instance is initialized with the `::new` method and passed the string `"Fluffy"` as an argument. `::new` calls the class's `initialize` method, defined on lines 4-6. WIthin the `initialize` method, the `#to_s` method is invoked on the local variable `name`, which references the argument string `"Fluffy.` This is the `String#to_s` method, which returns `self` when called on a string. So, `"Fluffy"` is assigned to `@name`, and the new `Pet` instance is assigned to the local variable `fluffy`.

On line 16, `puts fluffy.name` is executed. First, `fluffy.name` returns `"Fluffy"`, which is a `String`. `puts` then prints the `String` to the screen. Note that the `Pet#to_s` method is not invoked on this line, because `fluffy.name` returns a string.

On line 17, `puts fluffy` is executed. Referencing `fluffy` returns the `Pet` instance assigned to `fluffy`. `puts` then calls `#to_s` on that object in order to print a string representation to the screen, so `Pet#to_s` is invoked. This method first mutates the value of `@name`, upcasing the string, then returns "My name is FLUFFY." This is printed.

On line 18, when we output the `name` of `fluffy`, we now see `FLUFFY`, because the string was mutated by `#upcase!`. We see the same value on line 19, because the local variable `name` references the same `String` object that is assigned to `@name`.

..

To fix: Instead of mutating `#upcase!`, simply call `#upcase` on the interpolated `#{name}` on line 10. This avoids mutating the string `"Fluffy".`
=end
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end


# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name) # a new Pet instance with an attribute @name with the value "42" is returned and assigned.
name += 1 # value of local var `name` is incremented by 1
puts fluffy.name # 42 - The `name` getter returns the string `42`, which is printed. 
puts fluffy # Passing the `Pet` instance assigned to `fluffy` to `puts`. `puts` invokes `Pet#to_s`, which returns "My name is 42," which is then output by `puts`.
puts fluffy.name # 42 - `@name` still references the string "42."
puts name # 43 - the local var `name` now references 43

# `@name` and `name` never reference the same object.

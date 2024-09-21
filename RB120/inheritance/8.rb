=begin
# Method Lookup (Part 2)

Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes and modules that Ruby will check when searching for the #color method.
=end

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Method lookup path:
  # Cat
  # Animal
  # Object
  # Kernel  (is a module included by the Object class)
  # BasicObject  (does not inherit from any other class)
  # no `#color` method is found!
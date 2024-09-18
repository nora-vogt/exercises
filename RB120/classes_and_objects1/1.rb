# Find the Class
=begin
Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.

Add call #class on the object. All the values below are objects, and the #class method tells us which class an object belongs to.
=end

puts "Hello".class     # String
puts 5.class           # Integer
puts [1, 2, 3].class   # Array

# can also create a custom implementation of the #puts method

def puts(object)
  p object.class
end

puts "Hello"
puts 5
puts [1, 2, 3]
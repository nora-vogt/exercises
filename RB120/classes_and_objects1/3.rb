=begin
Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.

1. Create the class using the reserved word `class` and PascalCase for the class's name
2. Create an instance of the class with the `::new` method
3. Assign the newly created object to a variable
=end

class Cat
end

kitty = Cat.new

# can also use syntax:
ruby = Cat::new

p kitty
p ruby
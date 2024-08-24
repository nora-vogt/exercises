=begin
Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output

Teddy is 69 years old!
=end

# Array has a #sample method, Range does not.
# age = (20..200).to_a.sample

# Can use Kernel#rand with a range
#age = rand(20..200)

#puts "Teddy is #{age} years old!"

# Further Exploration

def get_name()
  print "Enter your name: "
  name = gets.chomp
end

def print_age(name)
  name = name.empty? ? "Teddy" : name
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

name = get_name
print_age(name)
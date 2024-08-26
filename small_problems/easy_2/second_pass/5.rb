=begin
Greeting a user

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

ALGORITHM:
- GET the user's name
  - SET to name
- IF the last character of name is "!"
  - PRINT the greeting in all caps
- IF not, 
  - PRINT the greeting normally
=end

print "What is your name? "
name = gets.chomp

if name[-1] == "!"
  puts "Hello #{name[0..-2]}. Why are we screaming?".upcase
else
  puts "Hello #{name}."
end

# Further Exploration
print "What is your name? "
name = gets
name.chomp!

if name[-1] == "!"
  name.chop!
  puts "Hello #{name}. Why are we screaming?".upcase
else
  puts "Hello #{name}."
end
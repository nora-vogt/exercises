=begin
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:

repeat('Hello', 3)

=end

def repeat(string, repetitions)
  repetitions.times { puts string }
end

repeat('Hello', 3)
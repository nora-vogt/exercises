=begin
For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
This code demonstrates that Procs have lenient arity. When `my_proc.call` is executed without any arguments, `thing` has a value of `nil` when it is interpolated into the string to be output. No error is raised. Parameters that aren't bound to an argument reference `nil`.

Procs can be created with the `proc {}` synax, instead of Proc.new.

# Group 2
3 ways to create a Lambda:
1. Lambda.new { code }
2. lambda { code}
3. -> (params) { code }

Lambdas are Proc objects. They include (lambda) in the representation of the object that is output with #puts.

This group demonstrates that lambdas have strict arity - the number of arguments passed when calling the lambda must match the number of parameters. `my_lambda.call` raises an ArgumentError.

# Group 3
Methods that include `yield` will raise a LocalJumpError when called with no implicit block passed.

Blocks have lenient arity. With the first invocation of `block_method_1`, no argument is passed to `yield`. `seal` references `nil` when it is interpolated in the string.

# Group 4
Because blocks have lenient arity, fewer arguments than parameters can be passed to the block without raising an error.

The implicit block passed to the method as an argumet does not have access to method local variables unless they are passed to `yield` when the block is executed.

# Explain the differences between Procs, Blocks, and Lambdas.

A lambda is a type of Proc object. A block is a grouping of code, not an object.

Procs and blocks have lenient arity, while lambdas have strict arity. Lenient arity means that the number of arguments passed to a Proc or block does not have to match the number of parameters defined. Any parameters that aren't bound to arguments will reference `nil`.

Strict arity means that the number of arguments passed to a lambda must exactly match the number of parameters defined, otherwise an ArgumentError will be raised.
=end

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # #<Proc:0x00007fb79ad43470 solution.rb:8>
puts my_proc.class # Proc
my_proc.call # This is a .
my_proc.call('cat') # This is a cat.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # #<Proc:0x00007fdac284f248 solution.rb:24 (lambda)>
puts my_second_lambda # #<Proc:0x00007f4082a3fb28 solution.rb:25 (lambda)>
puts my_lambda.class # Proc
my_lambda.call('dog') # This is a dog.
my_lambda.call # Raises an ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a .
block_method_1('seal') # Raises a LocalJumpError

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end # This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."} # NameError
# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

=begin
# Further Exploration

Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.
=end

# def compute(value)
#   block_given? ? yield(value) : 'Does not compute.'
# end

# p compute(5) { |num| num * 5 } # => 25
# p compute('hi') # => "Does not compute."
# p compute("hello") { |str| str + " world" } # => "hello world"


# Further exploration with arg and explicit block parameter

def compute(value, &block)
  block_given? ? block.call(value) : 'Does not compute.'
end

p compute(5) { |num| num * 5 } # => 25
p compute("good morning")
p compute("i need") { |str| str + " coffee!!!"} # "i need coffee!!!"
=begin
# Method to Proc

one method from the Object class
Goal is to convert an array of integers to base 8 numbers
Int#to_s(8) -> returns a string of int converted to base 8 number
=end

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

p convert_to_base_8(8)

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc
p base8_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]

=begin
#convert_to_base_8 - method takes a number as argument, `n`, converts to base-8 with `to_s(8)`, which returns a string. `#to_i` converts back to integer.

base8_proc = method(:convert_to_base_8).to_proc
- This makes a method object out of the convert_to_base_8 method
- Which is then converted to a proc with `Method#to_proc`

[8,10,12,14,16,33].map(&a_proc)
- We want to access the functionality of the convert_to_base_8 method.
- That method has been converted to a Proc object
- Using & lets us turn a Proc into a block, which can be passed as an argument to `#map`


# How does a method look when converted to a Proc?
def convert_to_base_8(n)
  n.to_s(8).to_i
end

Proc.new { |n| n.to_s(8).to_i }
# when we use & to convert our Proc to a block, it expands out to...

[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }
=end
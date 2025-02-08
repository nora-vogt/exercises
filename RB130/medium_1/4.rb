=begin
# Passing Parameters 2

Write a method that takes an array as an argument. Method should yield the contents of the array to the block.

The block should assign its parameters in such a way that it ignores the first two elements, and groups all remaining elements as a `raptors` array

Takeaways:
- The * splat operator on `raptors` tells Ruby to treat the block parameter as an array and assign all remaining values to it.
=end

def group(items)
  yield(items)
end

birds = %w(raven finch hawk eagle)
group(birds) do |first, second, *remaining| 
  raptors = remaining
  p raptors
end

# LS Solution - basically the same, just different block implementation

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}"
end
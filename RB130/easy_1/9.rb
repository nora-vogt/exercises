# Enumerable#one?

# If the block returns a truthy value for exactly one element, #one? returns true.
# #one? short-circuits and stops iterating if the block returns a truthy value for the second time.

def one1?(collection)
  counter = 0
  collection.each do |value|
    counter += 1 if yield(value)
    return false if counter > 1
  end

  counter == 1
end

# breaks rule about stopping iteration
def one?(collection)
  collection.count { |value| yield(value) } == 1 ? true : false
end

# LS Solution
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
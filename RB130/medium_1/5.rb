=begin
# Passing Parameters Part 3


=end


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# equivalent method
def gather(*produce, wheat)
   puts "Let's start gathering food."
   puts produce.join(", ")
   puts wheat
   puts "We've finished gathering!"
end

# 1
gather(items) do |*items, wheat|
  puts items.join(", ")
  puts wheat
end

# 2
gather(items) do |apples, *items, wheat|
  puts apples
  puts items.join(", ")
  puts wheat
end

# 3
gather(items) do |apples, *items|
  puts apples
  puts items.join(", ")
end

# 4
gather(items) do |item1, item2, item3, item4|
  puts [item1, item2, item3, item4].join(", ")
end





=begin 
# Complete The Program - Houses

Assume you have the following code, and this output:
Home 1 is cheaper
Home 2 is more expensive

Modify the House class so that the above program will work. You are permitted to define only one new method in House.
=end

class House
  include Comparable 

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
Further Exploration

Is the technique we employ here to make House objects comparable a good one? (Hint: is there a natural way to compare Houses? Is price the only criteria you might use?) What problems might you run into, if any? Can you think of any sort of classes where including Comparable is a good idea?

We may wish to compare houses by other criteria: location, number of bedrooms, square footage, etc. In which case, our custom `<=>` method won't work - it can only compare price. I would be inclined to compare prices by using our getter method: `home1.price < home2.price`, which uses `Integer#<` Or, we could write an instance method, `cheaper_than?(other_house)` to do the price comparison. These approaches also make it more clear exactly what attribute of houses we are comparing.

Classes where some attributes are numbers or strings may need to mix in the Comparable module.
=end
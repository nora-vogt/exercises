=begin  
# What Will This Do?

What will the following code print?

`Something.dupdata` is invoking the class method `::dupdata`, which will output the string `"ByeBye"`. `thing.dupdata` is invoking the instance method `#dupdata`, which concatenates the value of `@data` to itself and returns a new string, which will be output by `puts`.
=end

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # Will output 'ByeBye'
puts thing.dupdata # Will output 'HelloHello'
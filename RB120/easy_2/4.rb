=begin  
# Reverse Engineering

Write a class that will display:

ABC
xyz

when the following code is run:
=end

class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase # ABC - instance method
puts Transform.lowercase('XYZ') # xyz - class method
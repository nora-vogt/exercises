=begin
Modify this class so both flip_switch and the setter method switch= are private methods.

# Further Exploration

Add a private getter for @switch to the Machine class, and add a method to Machine that shows how to use that getter.
=end

class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    puts "The switch is #{switch}."
  end

  private
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
p machine.start
p machine # @switch is on
p machine.stop
p machine # @switch is off
# machine.flip_switch(:on)  # NoMethodError private method `flip_switch' called for #<Machine:0x0000000111c9fe48 @switch=:off>
#machine.switch = :on # NoMethodError private method `switch=' called for #<Machine:0x0000000109c5fe18 @switch=:off> (NoMethodError)


machine.status # The switch is (on/off)
p machine.switch # NoMethodError

require 'pry'
=begin
PROBLEM: Write a program that randomly generates robot names.

RULES:
- Robot name must lead with 2 capitalized letters, followed by 3 numbers 0-9
- Each time a robot is initialized, it gets a name
- All robot names must be unique
- Can reset robot name - sets name to -- nil? empty string?

# EXAMPLES
  #name returns a string like RX837 or BC811

# DATA STRUCTURES
string for individual robot name
- a way to keep track of all robot names - array?

# ALGORITHM:
public instance methods:
- @name setter
  - reassign @name
    - should @name only be allowed to be reassigned if it was reset? (empty string)
  - return @name

- @name getter
  - return @name if robot's name has already been assigned (not nil)

  - generate a new name
  - validate that new name is unique
  - reassign @name
  - add new name to @@name array
  - return @name

- reset
  - remove robot's current name from @@name
  - reassign @name to nil

private:
- generate_name
  - generates a new robot name
  - first 2 chars are A-Z, last 3 chars are string digits 0-9
  - create an array A-Z
  - create an array 0-9
  - iterate 5 times
    - first 2 iterations: randomly add a letter to name string
    - last 3 iterations: randomly add a digit to name string
  - returns the string

- generate_unique_name
  - generate a name
  - loop: check if generated name already exists as a robot name
    - if yes, generate a new name
    - if no, stop iterating
  - return the generated name
=end

class Robot
  @@names = []

  def name
    return @name if @name
    
    @name = generate_unique_name
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    self.name = nil
  end

  private

  attr_writer :name

  def generate_name
    name = ''
    2.times { name << ('A'..'Z').to_a.sample }
    3.times { name << ('0'..'9').to_a.sample }
    name
  end

  def generate_unique_name
    name = generate_name
    while @@names.include?(name)
      name = generate_name
    end
    name
  end

  def unique_name?(name)
    !@@names.include?(name)
  end
end

=begin
# LS Solution
Unique parts:

# generate_name
- use the #rand method to generate letters and digits
  - for letters: pass ASCII codes (65..90) for uppercase letters, then use the #chr method to convert number to a letter
  - for digits: pass 0-9, then call #to_s on integer

# name
- instead of a separate method to generate a unique name, validate in the method:
  @name = generate_name while @@names.include?(@name) || @name.nil?
- iterates while @@names includes the current name, or @name is nil
=end
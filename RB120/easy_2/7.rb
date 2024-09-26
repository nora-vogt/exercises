=begin
# Pet Shelter

Consider the following code. Write the classes and methods that will be necessary to make this code run, and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
=end

# class Pet
#   attr_reader :species, :name

#   def initialize(species, name)
#     @species = species
#     @name = name
#   end
# end

# class Owner
#   attr_accessor :number_of_pets
#   attr_reader :name, :pets
  
#   def initialize(name)
#     @name = name
#     @pets = []
#     @number_of_pets = 0
#   end
# end

# # Shelter needs to track each Owner who adopts a pet

# class Shelter
#   @@adopter_list = []  # Not the best choice, because this keeps track of every owner at every Shelter, rather than the owners who have adopted from a particular Shelter instance.

#   def adopt(owner, pet)
#     owner.pets << pet
#     owner.number_of_pets += 1
#     @@adopter_list << owner unless @@adopter_list.include?(owner)
#   end

#   def print_adoptions
#     @@adopter_list.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"

#       owner.pets.each do |pet|
#         puts "a #{pet.species} named #{pet.name}"
#       end
#       puts ''
#     end
#   end
# end

# LS Solution
class Pet
  attr_reader :animal, :name

  def initialize(animal, name, shelter)
    @animal = animal
    @name = name
    shelter.unadopted_pets << self
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  attr_reader :unadopted_pets

  def initialize
    @owners = {}
    @unadopted_pets = []
  end

  def print_number_of_unadopted_pets
    puts "The Animal Shelter has #{unadopted_pets.size} unadopted pets."
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
    unadopted_pets.delete(pet)
  end

  def print_unadopted_pets
    if unadopted_pets.size > 0
      puts "The Animal shelter has the following unadopted pets:"
      puts unadopted_pets # This is an Array containg Pet objects, passing an Array to #puts - #puts will call #to_s on each object, invoking `Pet#to_s`
    else
      puts "All pets have been adopted. Yay!"
    end
    puts
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

shelter = Shelter.new
butterscotch = Pet.new('cat', 'Butterscotch', shelter)
pudding      = Pet.new('cat', 'Pudding', shelter)
darwin       = Pet.new('bearded dragon', 'Darwin', shelter)
kennedy      = Pet.new('dog', 'Kennedy', shelter)
sweetie      = Pet.new('parakeet', 'Sweetie Pie', shelter)
molly        = Pet.new('dog', 'Molly', shelter)
chester      = Pet.new('fish', 'Chester', shelter)

shelter.print_unadopted_pets

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

shelter.print_unadopted_pets
=begin
Further Exploration

Add your own name and pets to this project.

Suppose the shelter has a number of not-yet-adopted pets, and wants to manage them through this same system. Thus, you should be able to add the following output to the example output shown above:

- Every time a new Pet is created, it should be added to the animal shelter's @unadopted_pets instance variable.
- Need a method to print all unadopted pets
- Need a method to count/print the number of unadopted pets
- Once a pet is adopted, we need to remove it from the @unadopted_pets list

Changes:
- Added Shelter as a collaborator object in Pet
- Every Pet has a Shelter, and every Shelter has Pets
=end
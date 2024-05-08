=begin
Input:
 - array (of strings)
Output:
  - hash
    - keys are vehicle type
    - values are count

Rules:
- vehicles are case-sensitive
- output is a hash, where keys are vehicle type (string), values are count (integer)

DATA STRUCTURE:
start: array
end: hash

ALGORITHM:
Given an array,
- Create a new empty hash
- Iterate through the given array
  - check if current element is already a key in the hash
    - if yes: increment value by 1
    - if no: create k/v pair, element is key and value is 1
- iterate through the hash
  - print the key / value pair

=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# First Solution
def count_occurrences(vehicles)
  vehicles_count = vehicles.tally
  vehicles_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

# Second Solution
def count_occurrences(vehicles)
  vehicles_count = vehicles.each_with_object({}) do |vehicle, hash|
    hash[vehicle] ? hash[vehicle] += 1 : hash[vehicle] = 1
  end
  vehicles_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

# LS Solution
def count_occurrences(vehicles)
  occurrences = {}
  vehicles.uniq.each do |vehicle|
    occurrences[vehicle] = vehicles.count(vehicle)
  end
  occurrences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

# Third Solution - use Hash::new with default value
def count_occurrences(vehicles)
  occurrences = Hash.new(0)
  vehicles.each { |vehicle| occurrences[vehicle] += 1 }
  occurrences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end


count_occurrences(vehicles) 
#   {"car"=>4, "truck"=>3, "SUV"=>1, "motorcycle"=>2}


# Further Exploration
# Solve problem when words are case insensitive

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'TrUcK',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(vehicles)
  occurrences = vehicles.map(&:downcase).each_with_object({}) do |vehicle, hash|
    hash[vehicle] ? hash[vehicle] += 1 : hash[vehicle] = 1
  end
  occurrences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end


count_occurrences(vehicles) 
  #{"car"=>4, "truck"=>3, "suv"=>2, "motorcycle"=>2}
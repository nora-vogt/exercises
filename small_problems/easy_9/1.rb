=begin
Input: array, hash
Output: string with interpolated values

Problem: 
- Given an array and a hash. Array contains elements of a person's name. Hash contains their title and occupation.
- Join the elements of name array with a space
- Print the desired greeting, using full name, title, and occupation.

Rules:
- array will contain strings
- hash has two keys, :title and :occupation
- join array elements with spaces to produce full name

ALGORITHM:
- join elements of array with space, assign to "full_name"
- use Hash#[] to reference title and occupation information
- interpolate desired values into string
- return the string

=end

# def greetings(name, details)
#   full_name = name.join(' ')
#   title = details[:title]
#   job = details[:occupation]
#   "Hello, #{full_name}! Nice to have a #{title} #{job} around."
# end

def greetings(name, details)
  full_name = name.join(' ')
  job = details.values.join(' ')
  "Hello, #{full_name}! Nice to have a #{job} around."
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# => "Hello, John Q Doe! Nice to have a Master Plumber around."
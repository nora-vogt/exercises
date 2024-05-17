=begin
Input: string (firstname, sapce, lastname)
Output: new string (lastname, comma, space, first name)

Rules:
- return a new string that contains the last name, a comma, a space, and the first name

ALGORITHM:
- given a string
- split string into an array of words on whitespace
- reverse the array
- join the array into a string with a comma + whitespace
=end

# Solution 1
# def swap_name(name)
#  name.split.reverse.join(', ')
# end

# Solution 2
# def swap_name(name)
#   split_name = name.split
#   first_name = split_name[0]
#   last_name = split_name[1]

#   "#{last_name}, #{first_name}"
# end

# Solution 2 refactored
def swap_name(name)
  first, last = name.split
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
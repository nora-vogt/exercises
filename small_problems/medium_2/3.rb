=begin
Input: a string
Output: a hash
  - keys are :lowercase, :uppercase, :neither
  - values are percentage of characters of each type from string

Rules:
- String will always contain at least one character
- Hash values should be Floats
- whitespaces count as "neither"

EXAMPLES:
'abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

total chars = 10
lowercase: 5 => 5.0/10 => 0.5 * 100

'123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

lowercase: 0 => 0.0 / 10 => 0.0 * 100

DATA STRUCTURES:
start: string

count of 
- lowercase, uppercase, neither chars

create hash, keys are symbol, values are count

iterate through hash, transforming it (nested array)

operate on the values to convert count to percent

convert nested array back to a hash

ALGORITHM:
given a string, string
- set "total_chars" to string.length
- Get count of lowercase chars in string
- Get count of uppercase chars in string
- Get count of other chars in string

- Create a new hash
 - uppercase key => uppercase count / total_chars * 100
 - repeat for other two cases

- return the new hash
=end

# def calculate_percent(count, total)
#   (count.to_f / total) * 100
# end

# def letter_percentages(string)
#   total_chars = string.length
#   upper_count = string.count('A-Z')
#   lower_count = string.count('a-z')
#   other_count = string.count('^a-zA-Z')

#   { lowercase: calculate_percent(lower_count, total_chars),
#     uppercase: calculate_percent(upper_count, total_chars),
#     neither: calculate_percent(other_count, total_chars)
#   }
# end

# LS Solution
  # set two empty hashes - counts, percentages
  # set array of chars in string
  # set toal string length
  # set keys in counts to values that are count of each char type in "characters" array (using String#=~)
    # #count with a block - returns count of elements for which the block return a truthy value
    # String#=~ returns the first index in calling string that matches given regex, returns nil if no match (block is returning 0 (counted) or nil (not counted))
  # calculate helper method
    # pass in empty percentages hash, count, length
    # converts count to percentages and populates percentages hash
    # percentages hash is mutated by this method
  # return percentages hash

# def letter_percentages(string)
#   counts = {}
#   percentages = {}
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}

#   calculate(percentages, counts, length)

#   percentages
# end

# def calculate(percentages, counts, lenth)
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 10
# end

# Further Exploration
# round solution to 1 decimal place

# option 1
# def calculate_percent(count, total_chars)
#   ((count.to_f / total_chars) * 100).round(1)
# end

# option 2
def calculate_percent(count, total_chars)
  percentage = (count.fdiv(total_chars)) * 100
  format('%.1f', percentage).to_f
end

def letter_percentages(string)
  total_chars = string.length
  upper_count = string.count('A-Z')
  lower_count = string.count('a-z')
  other_count = string.count('^a-zA-Z')

  { lowercase: calculate_percent(lower_count, total_chars),
    uppercase: calculate_percent(upper_count, total_chars),
    neither: calculate_percent(other_count, total_chars)
  }
end

# Student Solutions
  # Using Hash#transform_values
def letter_percentages(string)
  hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

  hash.transform_values do |regex|
    (string.count(regex) * 100.0 / string.size).round(1)
  end
end




p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}
=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

PROBLEM:
Given a string, return a hash that contains the percentages of each of the following characters: uppercase, lowercase, neither. Keys are the char type, value are the percent.

RULES:
- round percent to 1 decimal place
- input may not have all three char types
- values must always add to 100
- whitespace counts as 'neither'

EXAMPLES:
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

DATA STRUCTURES:
Input: String (different char types)

create a new hash
  - count chars of each type
  - calculate percent

Output: Hash (keys are char type, value is percent)

ALGORITHM:
Given a string,
- CREATE an empty result hash
- POPULATE the hash
  - DETERMINE percentage of lowercase chars
    - GET count of lowercase chars in input string
    - DIVIDE count converted to float by length of string
    - MULTIPLY result by 100
    - FORMAT the percent - round to 1 decimal place
    - ADD a k/v pair to hash: key is :lowercase, value is percentage
  - DETERMINE percentage of uppercase chars
    - repeat above steps
  - DETERMINE percentage of neither chars
    - repeat above steps
- RETURN the new hash
=end

# This method does two things - it gets the count and calculates the percentage. Should simplify to one.
def calculate_percentage1(string, char_type)
  char_count = case char_type
  when :lowercase
    #string.chars.count { |char| ('a'..'z').include?(char)}
    string.count('a-z')
  when :uppercase
    #string.chars.count { |char| ('A'..'Z').include?(char)}
    string.count('A-Z')
  else
    #string.delete('a-zA-Z').size
    string.count('^a-zA-Z')
  end

  ((char_count.to_f / string.length) * 100).round(1)
end

def letter_percentages1(string)
  percentages = {}
  string_length = string.length
  char_types = [:lowercase, :uppercase, :neither]
 
  char_types.each do |type|
    percentage = calculate_percentage(string, type)
    percentages[type] = percentage
  end
  
  percentages
end

# REFACTOR
=begin
Given a string,
- CREATE an empty hash
- CREATE an array containing symbols: uppercase, lowercase, neither
- POPULATE the result hash
  - ITERATE through the character_type array [type]
    - for each type,
    - GET the count of char type in string *helper
      - SET result to 'count'
    - CALCULATE percentage of count *helper
      - SET result to percentage
    - ADD k/v pair to hash
      - type is key, percentage is value

- DETERMINE the count of each char type in string *helper
  - Given an array, and a char_type
  - Count the characters that match char_type in string
  - return the count (integer)

- CALCULATE the percentage of each char type count in string
  - Given a count, and a string length
  - divide count by string length (converted to float)
  - multiply result by 100
  - round to 1 decimal place

- RETURN the result hash
=end

def count_characters2(characters, type)
  case type
  when :lowercase
    characters.count { |char| char =~ /[a-z]/ }
  when :uppercase
    characters.count { |char| char =~ /[A-Z]/ }
  when :neither
    characters.count { |char| char =~ /[^a-zA-Z]/ }
  end
end

def calculate_percentage2(char_count, string_length)
  ((char_count / string_length.to_f) * 100).round(1)
end

def letter_percentages2(string)
  percentages = {}
  character_types = [:lowercase, :uppercase, :neither]
  characters = string.chars
  string_length = string.length

  character_types.each do |type|
    count = count_characters(characters, type)
    percentage = calculate_percentage(count, string_length)
    percentages[type] = percentage
  end

  percentages
end

# LS SOLUTION
=begin
- uses the String#=~ method with a regex arg /[a-z]/ to count chars


string =~ regexp → integer or nil
string =~ object → integer or nil

Returns the Integer index of the first substring that matches the given regexp, or nil if no match found:

'foo' =~ /f/ # => 0
'foo' =~ /o/ # => 1
'foo' =~ /x/ # => nil
=end

# Really great solution from Esther
=begin
# Makes use of Hash#transform_values
  # one block parameter: the values of hash
  # returns a new hash. there is also #transform_values!
  # and transform_keys / transform_keys!

Given a string,
- CREATE a reference hash
  - keys are uppercase, lowercase, neither symbols
  - values are the selectors that will be used to count chars of each type
- ITERATE through the reference hash -> TRANSFORMATION
  - for each k/v pair [selectors]
  - COUNT the number of chars of current type in input string
  - CALCULATE percentage from count
  - RETURN the percentage
  - this is going from selectors to percentage for transformation
- RETURN the transformed hash
=end

def letter_percentages(string)
  reference_hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z'}
  string_length = string.length

  reference_hash.transform_values do |selectors|
    ((string.count(selectors) / string_length.to_f) * 100).round(1)
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}

# TIME: 20:07 - original
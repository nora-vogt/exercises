=begin
Input: array of strings
Output: print arrays (groups) of words that are anagrams

Rules:
- anagrams are words that have the same letters but in different order
- print Array objects of groups of anagrams to screen
- all strings in array will be single-word and lowercase

EXAMPLES:
output example:
["demo", "dome", "mode"]
["neon", "none"]

DATA STRUCTURE:
start: array
middle: nested array
end: output each nested array

ALGORITHM:
given an array, "words"
- create "anagrams" set to empty array
- iterate through words
  - for the current word, 
    - select any words from words array that are anagrams
    - add this array of anagrams to anagrams array
- iterate through anagrams array
  - output each subarray using p
=end

# First solution
def group_anagrams(words)
  anagrams = words.map do |word1|
    words.select { |word2| word2.chars.sort == word1.chars.sort }
  end.uniq
  anagrams.each { |subarray| p subarray }
end

# Using #group_by
def group_anagrams(words)
  anagrams = words.group_by { |word| word.chars.sort.join('') }.values
  anagrams.each { |group| p group }
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams(words)

# LS Solution
# result = {}
# words.each do |word|
#   key = word.split('').sort.join
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end 
# end

# result.each_value do |v|
#   puts "------"
#   p v
# end
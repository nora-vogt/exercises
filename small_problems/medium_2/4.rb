require 'pry'
=begin
Input: string containing parentheses
Output: boolean (true if parentheses are matched, false if otherwise)

Rules:
- matched parenthesis means () pairs
- if any parenthesis doesn't have a pair, return false
- if a string has no parentheses, return true
- pair is only balanced if parenthesis occur in proper order, ( then )
- open and closed parentheses do not need to be consecutive, only balanced: ex: (()) is valid

EXAMPLES:

'What (is) this?'
() => true

'What (is this?'
( => false

'Hey'
 => true

DATA STRUCTURE:
start: string

array of all parentheses

count (
count )
compare counts

ALGORITHM:
Given a string, string
- create a copy of string with all non-parenthesis characters removed, set to "parentheses"

# check if first parenthesis is open (
    # check if it has a pair )

    # repeat...

# iterate through, find a parenthesis:
  # is it ( ?
      # check if string includes a ) in subsequent characters
        # if yes, remove both ( ) from string

  # is it ) ?
    # return false

  # return true

=end

# def balanced?(string)
#   return true if string.chars.none? { |char| ['(', ')'].include?(char)}
#   parentheses = string.gsub(/[^()]/, '')
#   index = 0
#   loop do
#     if parentheses[index] == '(' && parentheses[index + 1..-1].include?(')')
#       parentheses.sub!(')', '')
#     else
#       return false
#     end
#     index += 1
#     break if index >= parentheses.size
#   end

#   parentheses.chars.all?('(')
# end


=begin
Second try algorithm and solution:
ALGORITHM:
given a string, "string"
- set "parentheses" to an empty string
- strip all non-parenthesis characters from string and add remaining chars to "parentheses"
- iterate parentheses.length - 1 times
  - check if char at index 0 in parentheses is (
    - if true: check if subsequent string slice contains )
      - if true: delete first ( and ) from parentheses
      - if false: stop iterating
    - if false: stop iterating

- check if parentheses is an empty string, return true if yes false if no
=end

# def balanced?(string)
#   parentheses = string.gsub(/[^()]/, '')

#   (parentheses.length - 1).times do
#     if parentheses[0] == '(' && parentheses[1..-1].include?(')')
#       parentheses.sub!('(', '')
#       parentheses.sub!(')', '')
#     else
#       break
#     end
#   end
#   parentheses.empty?
# end

# Refactored - can just check if our string of only parentheses includes () - it always will include a pair in that order if balanced.
def balanced?(string)
  parentheses = string.gsub(/[^()]/, '')

  (parentheses.length - 1).times do
    if parentheses.include?('()')
      parentheses.gsub!('()', '')
    else
      break
    end
  end
  parentheses.empty?
end

# LS Solution
# Uses a counter - increments with occurence of (, decrements with occurrence of )
  # Return value checks if counter is zero (should be if balanced)
  # guards against ) occurring first with break statement - stop iterating if parens has a negative value, meaning ) occurred first
  # Similar theme to mine - checking if string is empty (balanced) vs counter is zero (balanced).

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

# Further Exploration
# Match [], {}, '', "" pairs to be balanced
# other brackets - can put in an array and use #include?
# how to balance quotation marks? "" will always increment the counter
#   # separate quotes counter - it must be even
# def balanced?(string)
#   parens = 0
#   quotes = 0
#   leading_match = ["[", "(", "{"]
#   ending_match = ["]", ")", "}",]
#   string.each_char do |char|
#     quotes += 1 if ["\"", "'"].include?(char)
#     parens += 1 if leading_match.include?(char)
#     parens -= 1 if ending_match.include?(char)
#     break if parens < 0
#   end

#   parens.zero? && quotes.even?
# end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
p balanced?('[hey]') == true
# p balanced?('}{}') == false
# p balanced?('"hello""') == false
# p balanced?("apple''''''apple") == true

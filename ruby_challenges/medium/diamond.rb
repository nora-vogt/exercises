require 'pry'
=begin
# PROBLEM
Given a letter, print a diamond shape. The number position of the letter in the alphabet determines the number of rows from the top point to the middle point of the diamond.

RULES:
- Diamond first/last always begins/ends with A
- All rows except first/last have two identical letters
- The diamond is horizontally/vertically symmetric
- Width = height (same # of rows/cols)
- Top half of diamond has letters in ascending order to given letter
- Bottom half has letters in descending order, starting with given letter in middle row
- Input will be 1 capitalized letter
- The diamond is one continuous string!
  - letters spaced within a particular line length
  - each line, including the last one, ends with a newline char \n

# EXAMPLES
Letter: A
"A\n"

Letter: B (example is a 1-line string)
" A \n
B B\n 
A \n"

Letter: C
"  A  \n"\
" B B \n"\
"C   C\n"\
" B B \n"\
"  A  \n"

# BRAINSTORM
first/last line centered
subsequent lines:
- 2 letters, start with 1 space between, centered
- increment space until middle line
- decrement space until 2nd to last line
- append \n to EVERY line (join)

only need to build top half down to middle line
once letter line is built, get slice of lines array from 0..-2, reverse it, concatenate to lines array

max line width: 
- c is position 3
(position * 2) - 1
- can use idx if letters are in array - (idx * 2) + 1


# DATA STRUCTURES
Input: capital letter - string

array of uppercase alpha chars
array of strings - each line of diamond - join with newline

Output: single string with newline chars forming diamond shape when output

# ALGORITHM
Given a string, (single uppercase letter)
- set alphabet to an array containing all uppercase letters
- set diamond to an empty array
- get idx position of letter in alpha array - set to letter_index
- determine max width of center diamond line
  - multiply letter_index by 2, add 1
  - set to max_width

CREATE first half + middle line of dimaond
- create an array slice from alphabet, from 0 to letter_index
- set spaces to 1
- iterate through partial alphabet array, (letter)
  - if letter is "A", create a string that is max_width and center "A" in that string
    - add "\n" to end of string
    - push to diamond array
  - otherwise,
    - create a string: "{letter}{spaces}{letter}", center in a string max_width in length
      - add "\n" to end of string
    - push string to diamond array
    - increment spaces by 2

CREATE bottom half of diamond
- take slice of diamond array, from idx to -2
- reverse slice
- concatenate to diamond array

FIX LAST "A"
- append a newline char to final string in diamond array

CREATE DIAMOND STRING
- join diamond array with a newline char
- return the string

DEBUG:
- Need to add a \n even with 1-line diamond for "A". #join doesn't do that
- return the specific string if letter is "A"
- will be missing newline on end of final 'A' in diamond array, regardless of size
- solution: add when constructing the lines
=end
# class Diamond
#   ALPHABET = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     letter_index = ALPHABET.index(letter)
#     diamond = []
#     max_width = (letter_index * 2) + 1
#     spaces = 1
#     # build top half
#     ALPHABET[0..letter_index].each do |letter|
#       if letter == 'A'
#         line = letter.center(max_width) 
#       else
#         line = "#{letter}#{' ' * spaces}#{letter}".center(max_width)
#         spaces += 2
#       end
#       diamond << line + "\n"
#     end
   
#     # build second half
#     diamond += diamond[0..-2].reverse
#     diamond.join("")
#   end
# end

# REFACTOR:
#- separate building top/bottom into private class methods

# class Diamond
#   ALPHABET = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     top = build_top(letter)
#     bottom = build_bottom(top)
#     (top + bottom).join
#   end

#   class << self
#     private

#     def build_top(letter)
#       letter_index = ALPHABET.index(letter)
#       max_width = (letter_index * 2) + 1
#       spaces = 1
#       diamond_top = []
#       ALPHABET[0..letter_index].each do |letter|
#         if letter == 'A'
#           line = letter.center(max_width) 
#         else
#           line = "#{letter}#{' ' * spaces}#{letter}".center(max_width)
#           spaces += 2
#         end
#         diamond_top << line + "\n"
#       end
#       diamond_top
#     end

#     def build_bottom(diamond_top)
#      diamond_top[0..-2].reverse
#     end
#   end
# end

# puts Diamond.make_diamond('A')
# puts Diamond.make_diamond('B')
# puts Diamond.make_diamond('Z')

=begin
# LS Solution

::make_diamond - takes the letter

private class methods
::make_row

::determine_spaces - takes the current letter
(adds letters between B to current letter to an array, each time incrementing spaces by 2, using the array of letter to determine when to stop iterating)

- create an array containg B
- loop until the array includes the current letter
  - get the last letter in the array, set to current_letter
  - use the String#next method to get the subsequent letter
  - push that letter to array
  - increment # of spaces by 2
- return ' ' * number of spaces

::max_width
=end
class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
      binding.pry
    end.join("\n") + "\n"
  end

  class << self
    private

    def make_row(letter)
      return "A" if letter == 'A'
      return "B B" if letter == 'B'

      letter + determine_spaces(letter) + letter
    end

    def determine_spaces(letter)
      all_letters = ['B']
      spaces = 1
      until all_letters.include?(letter)
        current_letter = all_letters.last
        all_letters << current_letter.next
        spaces += 2
      end

      ' ' * spaces
    end

    def max_width(letter)
      return 1 if letter == 'A'

      determine_spaces(letter).count(' ') + 2
    end
  end
end

#Diamond.make_diamond('E')
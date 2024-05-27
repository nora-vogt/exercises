=begin

Spelling Blocks:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Input: 
- string

Output:
- Boolean

Rules:
- Each letter in each block can only be used once when spelling a word
- Cannot use both letters from a block when spelling a word
- Return true if the arg can be spelled from this set, false otherwise
- blocks should be case-insensitive (input: 'jest' => true)

EXAMPLES:
BATCH

B:O -> B
N:A -> A
G:T -> T
C:P -> C
H:U -> H

- does not use both letters from block
- does not repeat any letter

- when spelling, make sure:
  - if letter is key, has value been used?
  - if letter is value, has key been used?
  - has the letter already been used (keys or values)

{B: O}

DATA STRUCTURE
hash

ALGORITHM:
Given a string, "word"
- create the hash of letter blocks, set to "LETTERS"
- split the word into an array of characters, set to "characters"
  - upcase each character
- iterate through array of characters
  - for current character, "char"
  - return char occurs more than once in "word"
  - check if char if a key in LETTERS
    - if true: check if characters contains associated value
      - if true: return false
      - if false: move on
  - check if char is a value in LETTERS
    - if true: check if characters contains associated key
      - if true: return false
      - if false: move on
- return true
=end

LETTERS = { 'B' => 'O', 'X' => ':K', 'D' => 'Q', 'C' => 'P', 
            'N' => 'A', 'G' => 'T', 'R' => 'E', 'F' => 'S', 
            'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y', 
            'Z' => 'M'
}

def block_word?(word)
  word = word.upcase
  word.chars.each do |char|
    return false if word.count(char) > 1
    if LETTERS.has_key?(char)
      return false if word.include?(LETTERS[char])
    elsif LETTERS.has_value?(char)
      return false if word.include?(LETTERS.key(char))
    end
  end
  true
end

# Refactor(word)
def block_word?(word)
  word = word.upcase
  LETTERS.none? do |letter1, letter2|
    # word.include?(letter1) && word.include?(letter2) || 
    # word.count(letter1) > 1 || word.count(letter2) > 1
    # the word doesn't contain both letter1 and letter 2
    # the word doesn't repeat either/or letter1, letter2 twice
  end
end

# LS SOLUTION
# Enumerable#none - returns true if the block returns a falsy value on each iteration. Aka: Returns true if the block doesn't return a truthy value for every iteration.

# String#count takes *selectors
# By making the blocks two-character strings, 
  # up_string.count(block) >= 2 works
  # if the string contains both chars, block returns true
  # if the string contains a char from block more than once, block returns true


# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze
# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2}
# end

p block_word?('BUBBLE') == false
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# TIME: 17:22
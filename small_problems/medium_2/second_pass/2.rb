require 'pry'
=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PROBLEM:
Check if we can spell the input word without using both letters from any given block AND without repeating any letters.

RULES:
- Each letter can only be used once
- Each block can only be used once
- Input strings may be upper/lower case
- Block letters are uppercase
- Don't need to check whole word if an invalid pattern occurs at beginning
  - duplicate chars
  - both letters from a block used


p block_word?('BATCH') == true
p block_word?('BUTCH') == false -- uses H:U block twice (both letters in block)
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M


B U T C H 
^
check count of each letter in string
check if string includes value
or check if string includes key
  - false if yes


p block_word?('jest') == true
p block_word?('apples') == false -- repeats 'p'
p block_word?('Baby') == false -- repeats letters

DATA STRUCTURES:
Input: string of letters (upper or lowercase)

Block hash
break string into an array of chars
  - one letter from each block can be used
  - can only use each letter once


Output: Boolean (true if string is made from non-repeating letters from unique blocks, false otherwise)

ALGORITHM:
Given a string,
- CREATE the blocks hash - constant
- return false if the string contains any duplicate letters
  - iterate through array of upcased chars in word
    - get count of current char in upcased word
    - if count is > 1, return false


- SPLIT string into an array of chars [char]
  - for each char,
  - determine whether the char is the key in block hash or the value in block hash
    - assign the associated part of pair to var 'block_pair'
  - check if the word includes the block_pair
    - return false if yes
- otherwise, return true
=end



def duplicate_letters?(word)
  word = word.upcase
  word.chars.any? { |letter| word.count(letter) > 1 }
end

def block_word1?(word)
  return false if duplicate_letters?(word)
  word = word.upcase

  word.chars.none? do |char|
    block_pair = BLOCKS[char] || BLOCKS.key(char)
    word.include?(block_pair)
  end
end

=begin
ALGORITHM:
Given a string,
- CREATE the blocks hash
- REASSIGN input string to upcased version of string
- DETERMINE if the string uses any block twice
  - SPLIT the string into an array of chars [char]
    - for each char,
    - check if the blocks hash 
    - delete the pair that contains the char from the blocks hash
=end

=begin
ALG 3
Given a string,
- CREATE the blocks hash
- REASSIGN word to upcased version of itself
- DETERMINE if the string uses any block twice
  - ITERATE through the blocks hash [first_letter, second_letter]
    - IF the word contains more than one of either letter OR the word contains both letters
      - return false

- otherwise, return true
=end

BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q',
           'C' => 'P', 'N' => 'A', 'G' => 'T',
           'R' => 'E', 'F' => 'S', 'J' => 'W',   
           'H' => 'U', 'V' => 'I', 'L' => 'Y',
           'Z' => 'M'
}



def block_word2?(word)
  word = word.upcase
  BLOCKS.none? do |first_letter, second_letter|
    (word.include?(first_letter) && word.include?(second_letter)) || 
    word.count(first_letter) > 1 || word.count(second_letter) > 1
  end
end

# Refactor
# Like LS solution, but we concatenate each k/v from the hash into a string
# pass that string as the argument to count
# check if either/both of the letters occurs more than once
# count will count each char separately and return the total
def block_word3?(word)
  word = word.upcase
  BLOCKS.none? do |first_letter, second_letter|
    word.count(first_letter + second_letter) >= 2
  end
end


=begin
# LS SOLUTION
- make BLOCKS an array of letter pairs
- REASSIGN word to upcased version
- ITERATE through the array of blocks [block]
  - for each block (a 2-char string)
  - check if the count of the the block in the word is greater than 2
    # Array#count
    - when passing a multi-char string to #count, #count will treat each char as a separate instance to count
    - if count >= 2, return false

otherwise, return true

# The code ends up being the same whether you use an array or a hash, because you can iterate through the hash, concatenate the k + v, and pass that string as the arg to count.
=end
BLOCKS_ARR = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word4?(word)
  upcased_word = word.upcase

  BLOCKS_ARR.none? do |block|
    upcased_word.count(block) >= 2
  end
end

=begin
Other student approach:
- The number of blocks used should be equal to the length of the string
- Count the number of blocks used
  - iterate through the array of blocks
  - check if the string includes the block (count >= 1)
- Compare that count to length of string
  - if equal, return true, otherwise false
=end

def block_word?(word)
  upcased_word = word.upcase

  blocks_used = BLOCKS_ARR.count do |block|
    upcased_word.count(block) >= 1
  end

  blocks_used == word.size
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false


# TIME: 20mins
# got stuck
=begin
Get Middle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

PROBLEM:
Find and return the middle 1 or 2 characters of a string.

RULES:
- return 1 char if input is odd length
- return 2 chars if input is even length

Examples:

center_of('I love Ruby') == 'e' -- odd length
center_of('Launch School') == ' ' -- middle char may be whitespace
center_of('Launch') == 'un' -- even length
  size: 6
  middle 2: 2, 3
center_of('Launchschool') == 'hs'
  size: 12
  middle 2: 5, 6

center_of('x') == 'x' -- just one char

DATA STRUCTURES:
Input: string

output: new string - 1 or 2 center chars

BRAINSTORM:
In odd string, middle is length / 2 (int div)
In even string, middle is length / 2, plus the next char

DATA STRUCTURES:
Given a string,
- DETERMINE if string has odd or even length
  - IF odd length, get center char
    - Divide string length by 2
    - Return char at that index in string
  - IF even length, get 2 center chars
    - Divide string length by 2
    - Return char at that index + char at previous index
=end

def center_of1(string)
  center_idx = string.length / 2
  string.size.odd? ? string[center_idx] : string[center_idx - 1, 2]
end

# Another student solution
# Get array of chars, remove a char from start/end until you have 2 or less chars left

def center_of(string)
  chars_array = string.chars

  until chars_array.size <= 2
    chars_array.shift
    chars_array.pop
  end

  chars_array.join
end

p center_of('I love Ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
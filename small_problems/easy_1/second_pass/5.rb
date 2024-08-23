require 'pry'
=begin
Write a method that will take a short line of text, and print it within a box.

RULES:
- top/bottom lines start with +, then dashes
- middle lines start/end with | 
- text should always be centered within the box 
  - vertically and horizontally
- box is 5 lines
  - top
  - padding
  - text
  - padding
  - bottom
- box is 4 chars wider than input text

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

DATA STRUCTURES:
Input: string

construct each line

Output: printed box

BRAINSTORM:
- get length of text, add 4 to get box_width
- top/bottom line is "+" + "-" * box_width - 2 + "+"
- padding lines are "|" + " " * box_width - 2 + "|"
- text line is "|" + text + "|" centered in a line that is box_width size

ALGORITHM:
GIVEN a string,
- SET box_width to string length + 4
- CREATE top/bottom lines
  "+" + "-" * box_width - 2 + "+"
- CREATE padding lines
  "|" + " " * box_width - 2 + "|"
- CREATE text line
  "| " + text + " |"

OUTPUT:
- top
- padding
- text
- padding
- side
=end

def print_in_box(string)
  box_width = string.length + 4
  horizontal_line = "+" + ("-" * (box_width - 2)) + "+"
  padding = "|" + (" " * (box_width - 2)) + "|"
  center_text = ("| " + string + " |")

  puts horizontal_line
  puts padding
  puts center_text
  puts padding
  puts horizontal_line
end

=begin
Further Exploration

Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

PROBLEM: Truncate the string if > 80 chars

RULES: 
- Sides of box are 4 chars
- If 
ALGORITHM:
- IF input string > 76 chars
  - get a slice of input string, only first 76 chars
  - use that string to build the box
=end

def print_in_box_truncate(string)
  string = string[0..75] if string.length > 76
  box_width = string.length + 4
  horizontal_line = "+" + ("-" * (box_width - 2)) + "+"
  padding = "|" + (" " * (box_width - 2)) + "|"
  center_text = ("| " + string + " |")

  puts horizontal_line
  puts padding
  puts center_text
  puts padding
  puts horizontal_line
end

=begin
# FURTHER EXPLORATION: WORD WRAP

PROBLEM: 
Given a string of variable length, print it in a box. Implement a word wrap - if a word will cause the line to exceed 80 chars (including the box), wrap to the next line.

DATA STRUCTURES:
Input: String

Array of words in string

Output: Printed box

BRAINSTORM:
second idea:
  - set start_idx to 0
  - set end_idx to 75
loop while end_idx < length of input string
  iterate through range of indices, from 0 - 75 (max length of line - 76 chars + box)
    - get slice of string [start idx, end idx]
    - print the line in the box
    - increment both start idx and end_idx by 75
** doesn't account for words, just cuts off the line **

10 chars max
'The moon is full.'
[The moon is full]
[] ? 10
[The]
"The moon" ? 10
[The moon is]
"The moon is" ? 10 - YES, exceeds 10

only print "The moon"

current_line = []

array of words in string
  - test_line = []
  iterate through [word]
  check if pushing word to test_line array exceeds 76 chars when converted to a string, joined w/ whitespace
    - if yes: join "current_line" to a string, print the line
    - if no: push word to current_line

ALGORITHM TO PRINT TEXT LINES:
Given a string,
- SET current_line to an empty array
- BUILD the current line
  - ITERATE through an array of words in string - split on whitespace [word]
    - SET test_line to a copy of current_line
    - SET 
    - PUSH word to test_line array
    - CHECK IF test_line array converted to a string (join w/ whitespace) length > 76
      - if yes: convert current_line to string, print the line
        - SET current_line to a new array containing the current word
      - if no: push word to current_line
=end

=begin
# DEBUGGING
- the word wrap may leave extra spaces at end of line, need to take care of that
- the current_line needs to reset with each new word -- new words are being skipped

- The last few words of input (after the word wrap) aren't actually printing! 
  - Need a way identify when we've reached the characters that will be on the last line of the text. Right now, there is no logic printing them - it only works for earlier lines.

needs: a way to determine if there are only 76 or less chars left in the string that haven't been printed yet
Refactor the loop:
- SET current_line to an empty array
- SET line_length to 76
- SET string_words to an array of all words in the string
- SET word_index to 0
- LOOP
    IF remaining words in string_words (from idx 0 to -1) pushed into current_Line, coverted to a string has 76 or less chars
        - push remaining words into current_line, print the line
    ELSIF ...
  END
=end

def print_text_lines(string)
  current_line = []
  line_length = string.length >= 76 ? 76 : string.length
  string_words = string.split

  string_words.each_with_index do |word, index|
    remaining_chars = (current_line.join(' ') + ' ' + string_words[index..-1].join(' ')).strip
    if remaining_chars.length <= 76
      puts "| " + remaining_chars.center(line_length) + " |"
      break
    end

    test_line = current_line.dup
    test_line << word
    if test_line.join(' ').length > line_length
      current_string = current_line.join(' ')
      puts "| " + current_string.center(line_length) + " |"
      current_line = [word]
    else
      current_line << word
    end
  end
end

# This method of box_width isn't the best, consider starting w/ string length and adding for the lines?
def print_in_box_word_wrap(string)
  box_width = string.length < 76 ? string.length + 4 : 80
  horizontal_line = "+" + ("-" * (box_width - 2)) + "+"
  padding = "|" + (" " * (box_width - 2)) + "|"
  

  puts horizontal_line
  puts padding
  print_text_lines(string)
  puts padding
  puts horizontal_line
end

# print_in_box_truncate("To boldly go where no one has gone before. To boldly go where no one has gone before.")
print_in_box_word_wrap("To boldly go where no one has gone before. To boldly go where no one has gone before.")
print_in_box_word_wrap("Please excuse my dear Aunt Sally.")
print_in_box_word_wrap("")
print_in_box_word_wrap("I am already far north of London, and as I walk in the streets of
Petersburgh, I feel a cold northern breeze play upon my cheeks, which
braces my nerves and fills me with delight. Do you understand this
feeling? This breeze, which has travelled from the regions towards
which I am advancing, gives me a foretaste of those icy climes.
Inspirited by this wind of promise, my daydreams become more fervent
and vivid. I try in vain to be persuaded that the pole is the seat of
frost and desolation; it ever presents itself to my imagination as the
region of beauty and delight. There, Margaret, the sun is for ever
visible, its broad disk just skirting the horizon and diffusing a
perpetual splendour. There—for with your leave, my sister, I will put
some trust in preceding navigators—there snow and frost are banished;
and, sailing over a calm sea, we may be wafted to a land surpassing in
wonders and in beauty every region hitherto discovered on the habitable
globe. Its productions and features may be without example, as the
phenomena of the heavenly bodies undoubtedly are in those undiscovered
solitudes. What may not be expected in a country of eternal light? I
may there discover the wondrous power which attracts the needle and may
regulate a thousand celestial observations that require only this
voyage to render their seeming eccentricities consistent for ever. I
shall satiate my ardent curiosity with the sight of a part of the world
never before visited, and may tread a land never before imprinted by
the foot of man. These are my enticements, and they are sufficient to
conquer all fear of danger or death and to induce me to commence this
laborious voyage with the joy a child feels when he embarks in a little
boat, with his holiday mates, on an expedition of discovery up his
native river. But supposing all these conjectures to be false, you
cannot contest the inestimable benefit which I shall confer on all
mankind, to the last generation, by discovering a passage near the pole
to those countries, to reach which at present so many months are
requisite; or by ascertaining the secret of the magnet, which, if at
all possible, can only be effected by an undertaking such as mine.")
=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

PROBLEM:
Given a text file, read the file, parse it, return the number of words in the longest sentence. Also print the sentence.

RULES:
- Sentences end with . ! ?
- words are a sequence of characters that are not spaces or sentence-ending characters
- print the number of words in the longest sentence

EXAMPLES:
Another Example

Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

The longest sentence in this book is 157 words long.

DATA STRUCTURES:

ALGORITHM:
- READ the text file into the program
- FORMAT the text into a string - remove any newline characters
- SPLIT the text into an array of sentences
  - split when there is sentence-ending punctuation followed by whitespace, but preserve the punctuation
- ITERATE through an array of sentences
  - for each sentence
    - split on whitespace into an array of words
    - COUNT the number of words in each sentence
- RETURN the sentence with the most words and return the number of words



=end
# text = File.read('example_text.txt')
# text = File.read('pg84.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"

# Regex to split string but keep delimiter in transform_file
  # () - capture group - treats multiple characters as a single unit; the match will match the whole group. as compared to [abcd] matches a or b or c or d
  # ?<=  - Positive Lookbehind - Matches a group before the main expression without including it in the result.
  # [ ] - Character group - match any character in the set (?.!)
  # \s - followed by a whitespace 
  # * - Quantifier - match 0 or more of the preceeding token (match 0 or more whitespaces) # not needed if we strip the string of extra whitespace first
  # The character set in the positive lookbehind will be matched, but not used to split. The \s after the lookbehind will be matched and used to split, removing whitespaces between sentences while keeping the ending punctuation.
#sentence_array = file1.split(/(?<=[?.!])\s*/)

#text = File.read('example_text.txt').gsub("\n", ' ') # This removes the newline chars, replaces them with spaces.
text = File.read('pg84.txt')
sentences = text.split(/(?<=[?.!])\s*/)
#sentences = text.split(/(?<=\.)|(?<=\?)|(?<=!)/)
# p sentences
longest_sentence = sentences.max_by { |sentence| sentence.split.size }
number_of_words = longest_sentence.split.size
puts "The longest sentence is: #{longest_sentence}"
puts "It contains #{number_of_words} words."
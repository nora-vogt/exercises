=begin


Rules:
- Print the sentences with highest number of words
- Print the number of words in that sentence
- sentences end with periods (.), exclamation points (!), or question marks (?)
- Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
  - '--' together is a word. '!' is not a word.

ALGORITHM:
Given a .txt file,
- Read the text file with File#read into a string
- Replace all newline characters (\n) with spaces
- Split the string into an array of sentences after ending punctuation: . ! ?
- Iterate through the array of sentences
  - split each sentence on whitespace into an array of words
- Sort the array of words by length
  - print the longest sentence
  - print the length of longest sentence
=end

# Regex to split string but keep delimiter in transform_file
  # (?<= ) - Positive Lookbehind - Matches a group before the main expression without including it in the result.
  # [ ] - Character set - match any character in the set (?.!)
  # \s - whitespace 
  # * - Quantifier - match 0 or more of the preceeding token (match 0 or more whitespaces)
  # The character set in the positive lookbehind will be matched, but not used to split. The \s after the lookbehind will be matched and used to split, removing whitespaces between sentences while keeping the ending punctuation.
#sentence_array = file1.split(/(?<=[?.!])\s*/)

def read_file(file)
  File.read(file).gsub(/\s/, ' ') # \s will match any newline char
  #File.read(file).gsub(/[\r\n]/, ' ') # matches \r or \n newline chars
  #File.read(file).gsub("\n", ' ')
end

def transform_file(file)
  file.split(/(?<=[?.!])\s*/)
end

def longest_sentence(array)
  longest_sentence_array = array.map do |sentence|
    sentence.split(' ')
  end.sort_by { |subarray| subarray.size }.last#.join(' ')

  puts "The longest sentence has #{longest_sentence_array.size} words."
  puts "The longest sentence is: #{longest_sentence_array.join(' ')}"
end


file = read_file('1.txt')
sentence_array = transform_file(file)
longest_sentence(sentence_array)


# Solution works for pg84 file, but the split isn't quite right. "words" that contain periods (www.gutenberg.org) are split incorrectly. So are sentences like: "What a noble fellow!" you will exclaim.

file2 = read_file('pg84.txt')
sentence_array2 = transform_file(file2)
p sentence_array2
longest_sentence(sentence_array2)
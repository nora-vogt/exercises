=begin
Input: string
output: array containing "string length" for each substring

Rules:
- words are substrings separated by exactly 1 space
- any substrings of non-space characters is a word
- returned array should contain strings: each substring + space + length of substring

EXAMPLES:
cow sheep chicken 
[cow, sheep, chicken]
["cow 3", "sheep 5", "chicken 7"]

ALGORITHM:
- given a string, "string"
- break string into an array of substrings, separated on whitespace
- iterate through array of substrings - transform the array
  - get the length of current substring
  - append " count" to current substring
- return transformed array of substrings
=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

# LS Solution
def word_lengths(string)
  words = string.split

  words.map do |word|
    word + ' ' + word.length.to_s
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
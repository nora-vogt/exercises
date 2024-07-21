require 'pry'
=begin
Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

PROBLEM:
Create a text file, with several nouns, verbs, adjectives, and adverbs somehow demarcated. Read that text into the program. Iterate through each line of the text, and replace each indicated word type with a randomized word of the same type.

RULES:
- each type of word (noun, verb, etc) must be replaced with a word of the same type.
  - replace with a random word
- print the result

DATA STRUCTURES:
Input: text file - lines of strings

read text file into an array of words
hash of word types
  - word type is key, value is an array of strings
  { "adjective" => ['cool', 'brown', 'big'] }

Output: string with indicated words replaced

ALGORITHM:
Given a text file, 
- Read the file into program
  - read the file (File::read)
  - transform file data into an array of words
  - #split with no arguments will split on whitespace and newline chars \n

- Create the hash of replacement words
  - create a constant, REPLACEMENT_WORDS
  - word type is the key, value is an array

- Transform the array of words from the text file
  - iterate through the array -> transformation #map
    - for the current word
    - iterate through an array of keys in REPLACEMENT_WORDS hash
      - check if the current word includes the current key
      - if true: replace the word only with a random value from associated values array
    - return the word

- Join the array of words into a string, return the string
=end

file = File.read('1.txt').split

REPLACEMENT_WORDS = {
  "noun" => %w(fox dog head leg),
  "verb" => %w(jumps lifts bites licks),
  "adjective" => %w(quick lazy sleepy ugly),
  "adverb" => %w(easily lazily noisily excitedly)
}

# def remove_brackets(word)
#   word.gsub(/[%{}]/, '')
# end


# # Problems
#   # can't just do this - #include? will match adverb/verb mixup
#   # some words may contain commas, need to account for that
#   # play more with #format or #gsub
#     # want to substitute any %{word} for the random value
# # str1.gsub(/%{adverb}/, "hello")

def transform_text1(file)
  file.map do |word|
    #word = remove_brackets(word) if word.include?("{")
    REPLACEMENT_WORDS.keys.each do |key|
      word.gsub!(/%{#{key}}/, REPLACEMENT_WORDS[key].sample)
      #word.gsub!(key, REPLACEMENT_WORDS[key].sample) if word.include?(key)
    end

    word
  end.join(' ')
end

p transform_text(file)

# 47 mins ~ got stuck on how to sub in the word. this may not be the best way - have to iterate through all keys each time. can also try #format


# LS Solution
  # Open the file - File::open - returns a File object
  # Iterate through the File object - IO#each
    # for each line (string)
    # format the string with Kernel#format
      # Can use %{name} syntax inside of string to be formatted
      # Provide the string (line) as first arg
      # remaining args are keyword arguments - if the word in the %{} brackets matches the keyword, the value will be inserted into the string.
        # aka: the %{name} placeholder will be replaced by one of the values returned by NOUNS.sample etc
      # format also removes the newline char at the end of each line (string)

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('1.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
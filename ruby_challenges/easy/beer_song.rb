=begin
# PROBLEM
Write a program that can generate the lyrics of the 99 Bottles of Beer Song.

RULES:
- The song is a string.
- Verses number from 0-99
- Each sentence of the string ends with a newline character directly after the .
  "99 bottles of beer on the wall, 99 bottles of beer.\n"
- different verses are separated by an additional newline character \n
- no space between sentences, just the newline character

- for ::verses
  - if non-consecutive verse numbers are passed, treat that as a range and return ALL verses in that range

#EXAMPLES:
- The song follows this pattern for verses 99-3:
"#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
"Take one down and pass it around, #{number-1} bottles of beer on the wall.\n"

- Verse 2: second sentence is singular: "1 bottle of beer on the wall"
"2 bottles of beer on the wall, 2 bottles of beer.\n" \
"Take one down and pass it around, 1 bottle of beer on the wall.\n"

- Verse 1: tense changes first sentence; second sentence references no more bottles of beer
"1 bottle of beer on the wall, 1 bottle of beer.\n" \
"Take it down and pass it around, no more bottles of beer on the wall.\n"

- Verse 0: 
"No more bottles of beer on the wall, no more bottles of beer.\n" \
"Go to the store and buy some more, 99 bottles of beer on the wall.\n"

QUESTION:
- how exactly are strings formatted when broken up with \ ?

# DATA STRUCTURES
- string for the song

# ALGORITHM

class methods
::verse - takes 1 integer (number)- builds each verse
dynamic variables:
- start_number: if number == 0, then "no more", otherwise the number
- start_bottle (singal/plural): if number >= 2, use bottles, otherwise bottle
- remaining_number: check value of number
  - when 1 then 'no more'
  - when 0 then '99'
  - otherwise, number - 1
- end_bottle (single/plural): if remaining_number == 1, use 'bottle', otherwise 'bottles'
- line2 beginning: check the value of number
when 0, then start of verse 0
when 1, then "take it down and pass it around"
otherwise, "take one down...."

- interpolate values into verse

::verses - takes 2 integers, first is greater than second
- set verses to an empty array
- create a range from second num to first num
  - convert to array
  - reverse the array
- iterate through array of verse numbers
  - call ::verse and pass in current verse number
  - push it to verses array
- join verses array with newline char, return the string

Refactor
# iterate from first value down to second value

::lyrics - returns the whole song as 1 string, verses 99-0
- call ::verses, passing in 99 and 0 to return the whole song
=end

class BeerSong
  def self.verse(number)
    start_number = number == 0 ? 'no more' : number.to_s
    start_bottle = number == 1 ? 'bottle' : 'bottles'
    remaining_number = case number
    when 1 then 'no more'
    when 0 then '99'
    else number - 1
    end
    
    new_bottle = number == 1 ? 'it' : 'one'
    end_bottle = remaining_number == 1 ? 'bottle' : 'bottles'
    line2_start = case number
    when 0 then "Go to the store and buy some more,"
    when 1 then "Take it down and pass it around,"
    else        "Take one down and pass it around,"
    end

    "#{start_number.capitalize} #{start_bottle} of beer on the wall, " \
    "#{start_number} #{start_bottle} of beer.\n" \
    "#{line2_start} #{remaining_number} #{end_bottle} of beer on the wall.\n"
  end

  def self.verses(verse1, verse2)
    verses = []
    verse1.downto(verse2) { |number| verses << verse(number) }
    verses.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end

=begin
# LS Solution uses two_bottle_verse classes - Verse and BeerSong
- refactor without looking at full solution

- My solution also doesn't do any validation that valid numbers are provided
  - numbers must be from 99-0
  - for ::verses, first num must be larger than second num

ALGORITHM:
Verse:
# initialize - takes an integer
- sets @number to integer

# standard_verse_verse
- returns the standard_verse verse

# verse_two_bottle_verse
- returns the verse for 2 bottles

# verse_one
- returns the verse for 1 bottle

# last_verse
- returns the verse for 'no more bottles of beer'



BeerSong:
::verse - takes an integer
- create a new instance of Verse, passing in integer (verse #)
- use a case statement to determine which verse is returned

::verses - takes two_bottle_verse integers (higher # verse, lower # verse)
- create verses array
- iterates from first int down to second int
  - for each number, call ::verse, passing in number
  - add verse to verses array
- convert verses array to string, joining with a newline char
-return that string

::lyrics
- calls ::verses, passing in 99 and 0 to return all verses

# This was way easier than generating the verses in my original approach.
=end

# class Verse
#   attr_reader :bottles

#   def initialize(number)
#     @bottles = number
#   end

#   def standard_verse
#     "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
#     "Take one down and pass it around, " \
#     "#{bottles - 1} bottles of beer on the wall.\n"
#   end

#   def two_bottle_verse
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   def one_bottle_verse
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end

#   def last_verse
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end

# class BeerSong
#   def self.verse(bottles)
#     verse = Verse.new(bottles)
#     case verse.bottles
#     when 0 then verse.last_verse
#     when 1 then verse.one_bottle_verse
#     when 2 then verse.two_bottle_verse
#     else        verse.standard_verse
#     end
#   end

#   def self.verses(first_num, second_num)
#     verses = []
#     first_num.downto(second_num).each do |bottles| 
#       verses << BeerSong.verse(bottles)
#     end
#     verses.join("\n")
#   end

#   def self.lyrics
#     BeerSong.verses(99, 0)
#   end
# end
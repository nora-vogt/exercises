=begin
Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adjective, and an adverb and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end

print "Enter a noun: "
noun = gets.chomp.downcase

print "Enter a verb: "
verb = gets.chomp.downcase

print "Enter an adjective: "
adjective = gets.chomp.downcase

print "Enter an adverb: "
adverb = gets.chomp.downcase

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
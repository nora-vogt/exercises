require 'pry'
=begin
# process needs to count - pass in a symbol to get data?
# paragraphs
# count lines
# count words


# paragraphs have one empty line between them
# each line ends with a newline character
=end

# Original try
# This puts the implementation mostly in the process method. We really just want the process method to read the file.
#class TextAnalyzer
#   def process
#     file = File.readlines('2.txt')
#     paragraphs = file.count("\n") + 1
#     lines = file.size
#     words = file.map(&:split).flatten.reject(&:empty?).count
#     yield(paragraphs, lines, words)
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |paragraphs, lines, words| puts "#{paragraphs} paragraphs"}
# analyzer.process { |paragraphs, lines, words| puts "#{lines} lines" }
# analyzer.process { |paragraphs, lines, words| puts "#{words} words"}


# LS Solution
class TextAnalyzer
  def process
    file = File.open('2.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n").count("") + 1} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").size} lines" }
analyzer.process { |file| puts "#{file.split.map(&:chomp).count} words" }

# 3 paragraphs
# 15 lines
# 126 words
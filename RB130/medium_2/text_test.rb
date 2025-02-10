require 'minitest/autorun'
require_relative 'text'
require 'pry'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
    @file_text = @file.read
    @text = Text.new(@file_text)
  end

  def test_swap # original idea - counting the start/end #s of a and es
    a_count = @file_text.count('a')
    e_count = @file_text.count('e')
    swapped_text = @text.swap('a', 'e')

    assert_equal(a_count+e_count, swapped_text.count('e'))

    # Other assertion ideas from Bob Rodes
    # no letters lost or added
    assert_equal(@file_text.size, @text.swap('a', 'e').size)
    # no a's left
    assert_equal(0, @text.swap('a', 'e').count('a'))
  end

  def test_word_count
    #expected_count = @file_text.split.count
    #assert_equal expected_count, @text.word_count
    assert_equal 72, @text.word_count
  end

  # def test_swap # LS: Manually swap letters in text file, use HEREDOC
  #   text = Text.new(@file.read)
  #   actual_text = text.swap('a', 'e')
  #   expected_text = <<~TEXT.chomp
  #   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
  #   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
  #   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
  #   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
  #   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
  #   et verius meuris, et pheretre mi.
  #   TEXT

  #   assert_equal expected_text, actual_text
  # end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end


=begin
  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

# swap replaces all occurrences of one letter in the text with another letter

in setup:
  - read the file into a string
  - Text.new(passing in the string)


in teardown:
  - close the file
=end
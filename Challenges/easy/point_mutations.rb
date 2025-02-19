=begin
### PROBLEM
Write a program that can calculate the Hamming distance between two DNA strands.

Hamming Distance: When comparing two homologous strings (DNA strands), Hamming Distance is the count of the number of differences > the minimum number of point mutations that could have occurred.
- Aka: When comparing two strings, the number of positions in which the character is different.

Point mutation: One base is replaced with another at a single nucleotide.

RULES:
- Hamming distance is only defined for sequences of equal length
- If given two sequences fo unequal length, compute the hamming distance over the shorter length

### EXAMPLES:
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
Hamming Distance: 7


assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
ACCAGGG
ACTATGG
  ^ ^    Hamming Distance: 2

assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
AAACTAGGGG
AGGCTAGCGGTAGGAC
 ^^    ^  |STOP   Hamming Distance: 3

iterate through indices of shorter strang

### DATA STRUCTURES
DNATest instance initialized with: one string arg - @strand?

- strands are given as strings

### ALGO
#initialize
- accept a string argument, assign to @strand

#hamming_distance(other_strand) - calculate the Hamming distance
- takes a new string arg to compare with current string
- determine the shorter string
- set count to 0
- iterate through the chars of shorter string, with index
  - compare current char to char at index in other string
  - if chars are different, increase count by 1
- return count

=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    max_index = [strand.length, other_strand.length].min - 1
    (0..max_index).count { |index| strand[index] != other_strand[index] }
  end
end

# other versions
  # initial
  # def hamming_distance(other_strand)
  #   max_length = [strand.length, other_strand.length].min
  #   count = 0
  #   0.upto(max_length - 1) do |index|
  #     count += 1 unless strand[index] == other_strand[index]
  #   end
  #   count
  # end

  # LS Solution
  # def hamming_distance(comparison)
  #   shorter = @strand.length < comparison.length ? @strand : comparison
  #   differences = 0

  #   shorter.length.times do |index|
  #     differences += 1 unless @strand[index] == comparison[index]
  #   end

  #   differences
  # end
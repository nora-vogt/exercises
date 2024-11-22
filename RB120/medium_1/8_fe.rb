require 'pry'
=begin
# Further Exploration

Assume you're playing a game in which cards of the same rank are unequal. In such a game, each suit also has a ranking. Suppose that, in this game, a 4 of Spades outranks a 4 of Hearts which outranks a 4 of Clubs which outranks a 4 of Diamonds. A 5 of Diamonds, though, outranks a 4 of Spades since we compare ranks first. Update the Card class so that #min and #max pick the card of the appropriate suit if two or more cards of the same rank are present in the Array.


Spades > Hearts > Clubs > Diamonds

- compare rank # first
- if cards are the same, compare suit ranking
=end

class Card
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace'].freeze
  SUIT_RANKS = %w(Diamonds Clubs Hearts Spades
  ).freeze
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  # def <=>(other_card)
  #   if rank == other_card.rank
  #     SUIT_RANKS.index(suit) <=> SUIT_RANKS.index(other_card.suit)
  #   else
  #     RANKS.index(rank) <=> RANKS.index(other_card.rank)
  #   end
  # end

  # Refactor - uses behavior of Array#<=>
  def <=>(other)
    [RANKS.index(rank), SUIT_RANKS.index(suit)] <=> [RANKS.index(other.rank), SUIT_RANKS.index(other.suit)]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.min == Card.new(4, 'Diamonds')
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'
puts cards.max == Card.new('Jack', 'Spades')

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
puts cards.min == Card.new(8, 'Diamonds')
puts cards.max == Card.new(8, 'Spades')

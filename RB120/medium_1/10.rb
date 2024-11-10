require 'pry'

=begin
In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.

You should build your class using the following code skeleton.

# LS solution uses a hash to track the # of cards of each rank

  def initialize(cards)
    @cards = []
    @rank_count = Hash.new(0)

    5.times do
      card = cards.draw
      @cards << card
      @rank_count[card.rank] += 1
    end
=end

class Card
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    RANKS.index(rank) <=> RANKS.index(other.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  private

  def reset
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
    
    @cards.shuffle!
  end
end

class PokerHand
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def flush?
    @hand.all? { |card| card.suit == @hand[0].suit }
  end

  def straight?
    # only need ace-high straight
    current_ranks = @hand.map(&:rank)
    return false if current_ranks.any? { |rank| current_ranks.count(rank) > 1 }
    low_card_rank = Card::RANKS.index(@hand.min.rank)
    high_card_rank = Card::RANKS.index(@hand.max.rank)
    (high_card_rank - low_card_rank) == 4
  end

  def royal_flush?
    return false unless flush?
    royal_ranks = [10] + %w(Jack Queen King Ace)
    hand_ranks = @hand.map(&:rank)
    royal_ranks.all? { |rank| hand_ranks.include?(rank) }
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    current_ranks = @hand.map(&:rank)
    @hand.any? { |card| current_ranks.count(card.rank) == 4 }
  end

  def full_house?
    # Three cards of one rank and two of another
    three_of_a_kind? && pair?
  end

  def three_of_a_kind?
    current_ranks = @hand.map(&:rank)
    @hand.any? { |card| current_ranks.count(card.rank) == 3 }
  end

  def two_pair?
    current_ranks = @hand.map(&:rank)
    current_ranks.uniq.size == 3
  end

  def pair?
    current_ranks = @hand.map(&:rank)
    @hand.any? { |card| current_ranks.count(card.rank) == 2 }
  end
end


# Testing the Game

hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
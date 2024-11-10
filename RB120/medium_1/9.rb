require 'pry'
=begin
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

init
  - all 52 Cards
  - shuffle

# draw
- deal one card

# if deck is empty, reset itself by generating a new set of 52 shuffled cards
=end

class Card
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace'].freeze
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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13


drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
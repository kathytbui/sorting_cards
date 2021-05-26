require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Ace", "Spades")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of(Deck, @deck)
  end

  def test_it_takes_an_array_of_cards
    assert_instance_of(Array, @deck.cards)
    assert_instance_of(Card, @deck.cards.first)
  end

  def test_it_can_count_number_of_cards_in_deck
    assert_equal(5, @deck.count)
  end

  def test_it_can_sort_cards
    @deck.sort

    assert_equal(4, @deck.cards.first.rank)
    assert_equal(14, @deck.cards.last.rank)
    assert_equal("Diamonds", @deck.cards[3].suit)
    assert_equal("Spades", @deck.cards.last.suit)
  end

  def test_it_can_merge_sort_cards
    a = @deck.merge_sort(@deck.cards)

    assert_equal(4, @deck.cards.first.rank)
    assert_equal(14, @deck.cards.last.rank)
    assert_equal("Diamonds", @deck.cards[3].suit)
    assert_equal("Spades", @deck.cards.last.suit)
  end
end

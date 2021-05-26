require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/guess"
require "./lib/round"

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
    @guess = {value: "3", suit: "Hearts"}
    @another_guess = {value: "Jack", suit: "Diamonds"}
  end

  def test_it_exists
    assert_instance_of(Round, @round)
  end

  def test_count_number_of_guesses
    assert_empty(@round.guesses)
  end

  def test_current_card
    assert_equal(@card_1, @round.current_card)
  end

  def test_records_guess
    assert_instance_of(Guess, @round.record_guess(@guess))
  end

  def test_recods_correct_guess
    assert(@round.record_guess(@guess).correct?)
  end

  def test_stores_new_guess
    @round.record_guess(@guess)

    assert_equal(1, @round.guesses.size)
    assert_instance_of(Guess, @round.guesses.first)
  end

  def test_it_counts_correct_guesses
    @round.record_guess(@guess)

    assert_equal(1, @round.number_correct)
  end

  def test_it_stores_another_guess
    @round.record_guess(@guess)
    @round.record_guess(@another_guess)

    assert_equal(2, @round.guesses.size)
    assert_equal(1, @round.number_correct)
  end

  def test_it_gives_feedback
    @round.record_guess(@guess)
    @round.record_guess(@another_guess)

    assert_equal("Incorrect.", @round.guesses.last.feedback)
  end

  def test_can_calculate_percentage_correct
    @round.record_guess(@guess)
    @round.record_guess(@another_guess)

    assert_equal(50.0, @round.percent_correct)
  end
end

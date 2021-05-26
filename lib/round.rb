require "./lib/guess"
require "./lib/card"

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(guess)
    card = current_card
    @guesses << Guess.new("#{guess[:value]} of #{guess[:suit]}", card)
    @deck.cards.shift

    @guesses.last
  end

  def number_correct
    correct_counter = 0
    @guesses.each do |guess|
      if guess.correct? == true
        correct_counter += 1
      end
    end
    correct_counter
  end

  def percent_correct
    (number_correct.to_f / @guesses.size) * 100
  end
end

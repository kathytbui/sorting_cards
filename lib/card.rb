class Card
  attr_reader :suit, :value

  def initialize(value, suit)
    @suit = suit
    @value = value
  end

  def rank
    if value == "Ace"
      14
    elsif value == "King"
      13
    elsif value == "Queen"
      12
    elsif value == "Jack"
      11
    else
      value.to_i
    end
  end

  def suit_rank
    if suit == "Clubs"
      1
    elsif suit == "Diamonds"
      2
    elsif suit == "Hearts"
      3
    elsif suit == "Spades"
      4
    end
  end
end

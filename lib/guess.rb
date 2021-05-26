class Guess
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == "#{@card.value} of #{@card.suit}"
  end

  def feedback
    correct? == true ? "Correct!" : "Incorrect."
  end
end

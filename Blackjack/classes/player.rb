# frozen_string_literal: true

class Player
  attr_reader :cards

  def initialize(card1, card2)
    @cards = [card1, card2]
    @wins = 0
  end

  def pick(card)
    @cards << card
  end

  def update_round(cards, is_victory)
    @cards = []
    cards.each { |c| pick(c) }
    @wins += is_victory ? 1 : 0
  end

  def bust?
    score > 21
  end

  def win?(other_player)
    my_score = score
    other_player_score = other_player.score
    other_player_bust = other_player_score > 21 && my_score <= 21
    !bust? && (other_player_bust || (my_score > other_player_score))
  end

  def score
    result = @cards.inject(0) { |score, card| score + evaluate(card.first) }
    result -= 10 if @cards.include?(:Ace) && score > 21
    result
  end

  def description(_is_full = false)
    "Cards: #{@cards}, Score: #{score}, Wins: #{@wins}"
  end

  private

  def evaluate(rank)
    return rank if (2..10).include?(rank)
    return 11 if %i[Ace Jack].include?(rank)
    return 12 if rank == :Queen
    return 13 if rank == :King
  end
end

class Dealer < Player
  def description(is_full = false)
    if @cards.size == 2 && !is_full
      "Cards: #{@cards.first}, Wins: #{@wins}"
    else
      "Cards: #{@cards}, Wins: #{@wins}"
    end
  end
end

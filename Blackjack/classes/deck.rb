# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @ranks = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King]
    @colors = %i[♣ ♦ ♥ ♠]
    shuffle
  end

  def shuffle
    puts 'Shuffling...'
    @cards = @ranks.product(@colors).shuffle # https://stackoverflow.com/a/1543762/2450755
  end

  def pick
    @cards.shift
  end
end

# frozen_string_literal: true

class Deck
  def initialize
    @ranks = %i[Ace Jack Queen King] + [*2..10]
    print @ranks
    @colors = %i[♣ ♦ ♥ ♠]
    shuffle
  end

  def shuffle
    puts "\n...Shuffling..."
    @cards = @ranks.product(@colors).shuffle # https://stackoverflow.com/a/1543762/2450755
  end

  def pick
    @cards.shift
  end

  def to_s
    "Cards: #{@cards}"
  end
end

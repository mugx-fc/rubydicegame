# frozen_string_literal: false

class PlayerManager
  attr_reader :dices

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    roll
  end

  def roll
    puts 'Rolling...'
    @players = [Player.new(@player1, 1), Player.new(@player2, 2)]
  end

  def guess(guessed_index)
    winner = @players.max_by(&:dice)
    looser = @players.min_by(&:dice)
    you_win = winner.index == guessed_index

    puts 'You win!' if you_win
    puts 'You have lost!' unless you_win
    puts "#{winner} wins against #{looser}!"

    roll
  end

  def to_s
    description = "Players:\n"

    @players.each do |player|
      description << "- #{player}\n"
    end

    description
  end
end

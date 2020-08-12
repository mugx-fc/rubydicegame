# frozen_string_literal: true

class DiceManager
  def initialize
    roll
  end

  def roll
    puts 'Rolling...'

    @dices = [Dice.new, Dice.new]
    @guesses = []
  end

  def guess(value)
    @guesses << value

    puts 'You win!' if win?
    puts 'You lost!' if lost?
    roll if lost?
    win?
  end

  def win?
    @guesses == @dices.map(&:value)
  end

  def lost?
    @guesses.size == @dices.size && !win?
  end

  def debug
    puts "Dices: #{@dices.map(&:value)}"
    puts "Guesses: #{@guesses}"
  end
end

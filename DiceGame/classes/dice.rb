# frozen_string_literal: true

class Dice
  attr_reader :value

  def initialize
    roll
  end

  def roll
    @value = rand(1..6)
  end
end

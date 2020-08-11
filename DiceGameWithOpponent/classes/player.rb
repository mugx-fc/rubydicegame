# frozen_string_literal: true

class Player
  attr_reader :dice
  attr_reader :name
  attr_reader :index

  def initialize(name, index)
    @name = name
    @index = index
    @dice = rand(1..6)
  end

  def to_s
    "Player(#{@index}): #{@name}, dice = #{@dice}"
  end
end

# frozen_string_literal: true

class Cell
  attr_reader :color

  def initialize(cell_x, cell_y, size, color)
    @square = Square.new(x: cell_x, y: cell_y, size: size, color: color.to_s)
    @color = color
  end

  def electron?
    @color == :blue
  end

  def activate_electron
    if @color == :gray
      change_color(:yellow)
    elsif @color == :yellow
      change_color(:blue)
    end
  end

  def activate_conductor
    change_color(:yellow) if @color == :gray
  end

  def deactivate_conductor
    @next_color = :gray
  end

  def evolve(electron_neighbours)
    if @color == :blue
      @next_color = :red
    elsif @color == :red
      @next_color = :yellow
    elsif @color == :yellow && [1, 2].include?(electron_neighbours)
      @next_color = :blue
    end
  end

  def update
    change_color(@next_color) unless @next_color.nil?
    @next_color = nil
  end

  private

  def change_color(value)
    @color = value
    @square.color = @color.to_s
  end
end

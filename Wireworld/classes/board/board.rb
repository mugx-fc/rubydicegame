# frozen_string_literal: true

require_relative 'cell.rb'

class Board
  def initialize
    @size = 24
    @cols = 24
    @rows = 24
    @cells = []
  end

  def draw
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        offset = 1
        cell = Cell.new(col * (@size + offset), row * (@size + offset), @size, :gray)
        @cells << cell
      end
    end
  end

  def evolve
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        index = ((row * @cols) + col).ceil
        electron_count = electron_neighbours(col, row)
        @cells[index].evolve(electron_count)
      end
    end
  end

  def update
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        index = ((row * @cols) + col).ceil
        @cells[index].update
      end
    end
  end

  def electron_neighbours(col, row)
    electron_count = 0
    electron_count += count_electron_at(col - 1, row)
    electron_count += count_electron_at(col + 1, row)
    electron_count += count_electron_n(col, row)
    electron_count += count_electron_s(col, row)
    electron_count
  end

  def count_electron_n(col, row)
    res = count_electron_at(col, row - 1)
    res += count_electron_at(col - 1, row - 1)
    res + count_electron_at(col + 1, row - 1)
  end

  def count_electron_s(col, row)
    res = count_electron_at(col, row + 1)
    res += count_electron_at(col - 1, row + 1)
    res + count_electron_at(col + 1, row + 1)
  end

  def count_electron_at(col, row)
    if col >= 0 && col < @cols && row >= 0 && row < @rows
      @cells[(row * @cols) + col].electron? ? 1 : 0
    else 0
    end
  end

  def activate_electron(mouse_x, mouse_y)
    col = (mouse_x - mouse_x / @cols) / @cols
    row = (mouse_y - mouse_y / @rows) / @rows
    index = ((row * @cols) + col).ceil
    @cells[index].activate_electron
  end

  def deactivate_conductor(mouse_x, mouse_y)
    col = (mouse_x - mouse_x / @cols) / @cols
    row = (mouse_y - mouse_y / @rows) / @rows
    index = ((row * @cols) + col).ceil
    @cells[index].deactivate_conductor
  end

  def activate_conductor(mouse_x, mouse_y)
    col = (mouse_x - mouse_x / @cols) / @cols
    row = (mouse_y - mouse_y / @rows) / @rows

    index = ((row * @cols) + col).ceil
    @cells[index].activate_conductor
  end
end

# frozen_string_literal: true

require_relative './classes/dice_manager.rb'
require_relative './classes/dice.rb'

puts 'Welcome to the dice game!'
puts 'please select: (r) to roll, (q) to quit, (1..6) to guess'
dice_manager = DiceManager.new

loop do
  print '> '
  input = gets.chomp

  case input
  when 'r'
    dice_manager.roll
  when 'd'
    dice_manager.debug
  when 'q'
    puts 'Goodbye!'
    break
  when '1'..'6'
    break if dice_manager.guess(input.to_i)
  else
    puts 'ops, use the right commands...'
  end
end

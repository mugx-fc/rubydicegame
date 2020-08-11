# frozen_string_literal: true

require_relative './classes/player_manager.rb'
require_relative './classes/player.rb'

puts 'Welcome to the dice game with opponent!'

puts 'Please insert player 1'
print '> '
player1 = gets.chomp

puts 'Please insert player 2'
print '> '
player2 = gets.chomp
player_manager = PlayerManager.new(player1, player2)

puts 'Please select (r) to roll, (1..2) to guess the winner, (q) for quit'

loop do
  print '> '
  input = gets.chomp

  case input
  when 'r'
    player_manager.roll
  when 'd'
    puts player_manager.to_s
  when 'q'
    puts 'Goodbye!'
    break
  when '1'..'2'
    player_manager.guess(input.to_i)
  else
    puts 'Ops, use the right commands...'
  end
end

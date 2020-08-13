# frozen_string_literal: true

require_relative './classes/game.rb'

puts 'Welcome to Blackjack!'
puts 'Please select (h) to hit, (s) to stand, (d) to debug the game, (q) to quit'

game = Game.new

loop do
  print '> '
  input = gets.chomp

  case input
  when 'h'
    game.player_hit
  when 's'
    game.stand
  when 'd'
    game.print_round(is_debug: true)
  when 'q'
    puts 'Goodbye!'
    break
  else
    puts 'ops, use the right commands...'
  end
end

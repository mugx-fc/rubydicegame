# frozen_string_literal: true

require_relative './classes/game.rb'

puts 'Welcome to Blackjack!'
puts 'Please select (h) to hit, (s) to stand, (q) to quit'

game = Game.new

loop do
  print '> '
  input = gets.chomp

  case input
  when 'h'
    game.player_hit
  when 's'
    game.stand
  when 'q'
    puts 'Goodbye!'
    break
  else
    puts 'ops, use the right commands...'
  end
end

# frozen_string_literal: true

require_relative './classes/credit_card.rb'

puts 'Welcome to the credit card validator!'
puts 'Please insert the credit card number, (d) to default, (q) to quit'

loop do
  print '> '
  input = gets.chomp

  case input
  when '1'..'9'
    CreditCard.new(input).print_debug
  when 'd'
    CreditCard.new('4539 1488 0343 6467').print_debug
  when 'q'
    puts 'Goodbye!'
    break
  else
    puts 'ops, use the right commands...'
  end
end

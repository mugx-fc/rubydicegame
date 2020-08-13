# frozen_string_literal: true

require_relative './player.rb'
require_relative './deck.rb'

class Game
  def initialize
    @round = 1

    @deck = Deck.new
    @player = Player.new(@deck.pick, @deck.pick)
    @dealer = Dealer.new(@deck.pick, @deck.pick)

    print_round
  end

  def print_round(is_debug = false)
    puts "\n*** DEBUG ***" if is_debug
    puts "[Blackjack] round: #{@round}"

    puts '- Player:'
    puts "  #{@player.description(is_full: is_debug)}"

    puts '- Dealer:'
    puts "  #{@dealer.description(is_full: is_debug)}"
    puts "*************\n" if is_debug
  end

  def player_hit
    @player.pick(@deck.pick)

    puts "You pick: #{@player.cards.last}, score: #{@player.score}"
    puts 'You bust :-(' if @player.bust?

    bust = @player.bust?
    next_round(player_winner: false) if bust
  end

  def stand
    dealer_hit while @dealer.score < 17
    win = @player.win?(@dealer)

    puts "Player score: #{@player.score}, Dealer score: #{@dealer.score}"
    puts 'Cheers, You win :-) !' if win
    puts 'You lost, the dealer wins :-<' unless win
    next_round(player_winner: win)
  end

  def next_round(player_winner: bool)
    @round += 1
    @deck.shuffle
    @player.update_round([@deck.pick, @deck.pick], player_winner)
    @dealer.update_round([@deck.pick, @deck.pick], !player_winner)
    print_round
  end

  def dealer_hit
    @dealer.pick(@deck.pick)

    puts "Dealer picks: #{@dealer.cards.last}, score: #{@dealer.score}"
    puts 'The dealer busts :-)' if @dealer.bust?
  end
end

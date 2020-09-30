#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/game.rb'
require './lib/board.rb'

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

input = Proc.new {gets.chomp}
error = Proc.new {puts "Please input a valid name that's not an integer or empty or already taken."}
puts "What is Player 1's name?"
first_player = Player.new(input, error)
puts "What is Player 2's name?"
second_player = Player.new(input, error)

# random player goes first
players = first_player.random_player_start(second_player)
starting_player = players[0]
second_player = players[1]
puts "#{starting_player} will start"

# game starts

game = Game.new
loop do
  puts 'Input a number from 1 to 9 to choose a field!'
  move = gets.chomp.to_i
  case game.field_validation(move)
  when 1
    puts 'Not a valid number!'
    next
  when 0
    puts 'This field is taken.'
    next
  else
    puts game.board.display_board(game)
    if game.did_i_win == 1
      p "#{starting_player} wins the game!"
      break
    elsif game.did_i_win == 2
      p "#{second_player} wins the game!"
      break
    elsif game.taken_fields.length == 9
      p "It's a draw!"
      break
    end
    p "#{starting_player} is next!" if game.who_is_next == 1
    p "#{second_player} is next!" if game.who_is_next == 2
  end
end

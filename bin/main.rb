#!/usr/bin/env ruby

require './lib/game_logic.rb'

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

puts "What is Player 1's name?"
first_player = Player.new
puts "What is Player 2's name?"
second_player = Player.new

# random player goes first
players = first_player.random_player_start(second_player)
starting_player = players[0]
second_player = players[1]
puts "#{starting_player} will start"

# game starts

game = Game.new
board = Board.new
taken_fields = []
loop do
  puts 'Input a number from 1 to 9 to choose a field!'
  move = gets.chomp.to_i
  case game.field_validation(move, taken_fields)
  when 'No Integer Error'
    puts 'Not a valid number!'
    next
  when 'Taken Field Error'
    puts 'This field is taken.'
    next
  else
    puts board.display_board(taken_fields)
    if game.did_i_win(taken_fields) == 'Player 1 wins'
      p "#{starting_player} wins the game!"
      break
    elsif game.did_i_win(taken_fields) == 'Player 2 wins'
      p "#{second_player} wins the game!"
      break
    elsif taken_fields.length == 9
      p "It's a draw!"
      break
    end
    p "#{starting_player} is next!" if game.who_is_next(taken_fields) == 'starting player is next'
    p "#{second_player} is next!" if game.who_is_next(taken_fields) == 'second player is next'
  end
end

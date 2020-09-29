#!/usr/bin/env ruby

require './lib/game_logic.rb'
include Test

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

puts "What is Player 1's name?"
player1_name = gets.chomp

puts "What is Player 2's name?"
player2_name = gets.chomp

# random player goes first
players = random_player_start(player1_name, player2_name)
starting_player = players[0]
second_player = players[1]
puts "#{starting_player} will start"

# game starts

taken_fields = []
board = Board.new
loop do
  puts 'Input a number from 1 to 9 to choose a field!'
  move = gets.chomp.to_i
  case field_validation(move, taken_fields)
  when 'No Integer Error'
    puts 'Not a valid number!'
    next
  when 'Taken Field Error'
    puts 'This field is taken.'
    next
  else
    board.display_board(taken_fields)
    if did_i_win(taken_fields) == "Player 1 wins"
      p "#{starting_player} wins the game!" 
      break
    elsif did_i_win(taken_fields) == "Player 2 wins"
      p "#{second_player} wins the game!"
      break
    elsif taken_fields.length == 9
      p "It's a draw!" 
    end
    p "#{starting_player} is next!" if who_is_next(taken_fields) == "starting player is next"
    p "#{second_player} is next!" if who_is_next(taken_fields) == "second player is next"
  end
end

#!/usr/bin/env ruby

require './lib/game_logic.rb'

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

puts "What is Player 1's name?"
player1_name = gets.chomp

puts "What is Player 2's name?"
player2_name = gets.chomp

# random player goes first
players = random_player_start(player1_name,player2_name)
starting_player = players[0]
second_player = players[1]
puts "#{starting_player} will start"

# game starts

loop do
  puts 'Input a number from 1 to 9 to choose a field!'
  move = gets.chomp.to_i
  while validation(move) != true
    puts 'Please input a valid number between 1 and 9!'
    move = gets.chomp.to_i
  end


end
puts "#{second_player} goes next!"
puts 'This field is already taken!'

puts 'Please input a valid number between 1 and 9!'

puts "#{player1_name} wins!"
puts "#{player2_name} wins!"

puts "It's a draw!"

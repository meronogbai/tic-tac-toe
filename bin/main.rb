#!/usr/bin/env ruby

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

puts "What is Player 1's name?"
player1_name = gets.chomp

puts "What is Player 2's name?"
player2_name = gets.chomp

puts 'Input a number from 1 to 9 to choose a field!'

# random player goes first

puts "#{player1_name} goes first!"
puts "#{player2_name} goes first!"

# game starts

puts "#{player1_name} goes next!"
puts "#{player2_name} goes next!"

puts 'This field is already taken!'

puts 'Please input a valid number between 1 and 9!'

puts "#{player1_name} wins!"
puts "#{player2_name} wins!"

puts "It's a draw!"

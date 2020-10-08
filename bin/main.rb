#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

# intro to the game

puts 'Welcome to Tic Tac Toe!'
puts 'Are you ready to play?'

puts "What is Player 1's name?"
names = []  
loop do
  first_player = gets.chomp
  player = Player.new
  if player.name_check(first_player) == 0
    names.push(first_player)
    break
  else
    puts "Please input a valid name that's not an integer or empty or already taken."
  end 
end

puts "What is Player 2's name?"
loop do
  second_player = gets.chomp
  player = Player.new
  if !names.include?(second_player) && player.name_check(second_player) == 0
    names.push(second_player)
    break
  else
    puts "Please input a valid name that's not an integer or empty or already taken."
  end 
end

# random player goes first

starting_player = names[rand(2)]
names.delete(starting_player)
second_player = names[0]
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

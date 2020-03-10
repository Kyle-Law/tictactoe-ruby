#!/usr/bin/env ruby
require_relative "../lib/game_logic.rb"

puts "Welcome to Tic Tac Toe"
# player1
puts "Please enter Player 1 name"
player1 = gets.chomp
puts "Please enter Player 2 name"
player2 = gets.chomp

player = TicTacToe.new(player1,player2)

puts player.display_rule
puts player.display_board
loop do
  
  # Input Player X
  puts "#{player1}, select a cell from the above board"
  player1_move = gets.chomp.to_i
  until player.valid_input?(player1_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player1_move = gets.chomp.to_i
  end
  player.player_move("X", player1_move)
  puts player.display_board
  if player.win?("X")
    puts "Hurray! #{player1} has won"
  elsif player.draw?
    puts 'It\'s a draw.'
  end
  break if player.win?("X") || player.draw?
  # Input Player O
  puts "#{player2}, select a cell from the above board"
  player2_move = gets.chomp.to_i
  until player.valid_input?(player2_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player2_move = gets.chomp.to_i
  end
  player.player_move("O", player2_move)
  puts player.display_board
  if player.win?("O")
    puts "Hurray! #{player2} has won"
  elsif player.draw?
    puts 'It\'s a draw.'
  end
  break if player.win?("O") || player.draw?
end
#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
title = <<~MLS

   _____ _        _____             _____
  /__   (_) ___  /__   \\__ _  ___  /__   \\___   ___
    / /\\/ |/ __|   / /\\/ _` |/ __|   / /\\/ _ \\ / _ \\
   / /  | | (__   / / | (_| | (__   / / | (_) |  __/
   \\/   |_|\\___|  \\/   \\__,_|\\___|  \\/   \\___/ \\___|

MLS
puts title
puts 'Welcome to Tic Tac Toe!'

puts 'Please enter Player 1 name'
player1 = gets.chomp
puts 'Please enter Player 2 name'
player2 = gets.chomp

game = Game.new
board = Board.new
player_x = Player.new
player_o = Player.new

puts
puts <<~MLS
  Rule: #{player1} gets the first chance to select a cell from the board.
  Then #{player2} can select a cell. Selection of cell is done by the cell number.
MLS

puts
puts <<~MLS
  \'X\' is for #{player1}
  \'O\' is for #{player2}
MLS

puts

puts 'This is an empty board:'
puts board.display_board

puts
puts 'Press any key to start the game.'
gets.chomp
loop do
  # Input Player X
  puts "#{player1}, select a cell from the above board"
  player1_move = gets.chomp.to_i

  until game.valid_input?(player1_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player1_move = gets.chomp.to_i
  end
  game.delete_available_cells(player1_move)

  player_x.move(player1_move)

  board.board_config('X', player1_move)
  puts board.display_board

  puts "Hurray! #{player1} has won" if game.win?(player_x.cells)
  puts 'It\'s a draw.' if game.draw? && !game.win?(player_x.cells)

  break if game.win?(player_x.cells) || game.draw?

  # Input Player O
  puts "#{player2}, select a cell from the above board"
  player2_move = gets.chomp.to_i

  until game.valid_input?(player2_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player2_move = gets.chomp.to_i
  end
  game.delete_available_cells(player2_move)

  player_o.move(player2_move)

  board.board_config('O', player2_move)
  puts board.display_board

  puts "Hurray! #{player2} has won" if game.win?(player_o.cells)
  puts 'It\'s a draw.' if game.draw? && !game.win?(player_o.cells)

  break if game.win?(player_o.cells) || game.draw?
end

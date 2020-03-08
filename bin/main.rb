#!/usr/bin/env ruby

# Functions used in mock logic. These will be removed in milestone 3
def display_board(array) end

def win?(array) end

puts 'Rule: Player 1 gets the first chance to select a cell from the above board. '
puts 'Then Player 2 can select a cell. Selection of cell is done by the cell number.'

puts 'Tic Tac Toe board: '
puts ' 1 | 2 | 3 '
puts '---+---+---'
puts ' 4 | 5 | 6 '
puts '---+---+---'
puts ' 7 | 8 | 9 '

player1 = []
player2 = []
available_cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

loop do
  # Input Player 1
  puts 'Player 1, select a cell from the above board'
  player1_move = gets.chomp.to_i
  # Check if Player 1 is trying to put a cell no. that is already filled
  # If yes, then display an error message and ask Player 1 to retry
  until available_cells.include?(player1_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player1_move = gets.chomp.to_i
  end
  # Else add player1_move to player1 array
  player1 << player1_move
  # Then delete that cell no. from available_cells array
  available_cells.delete(player1_move)
  # Now the board is displayed with Player 1's move i.e. X in the given cell no.
  # by calling the display_board method with player1 array as the argument
  display_board(player1)
  # Check if Player 1 won
  # If yes, display message and break loop
  # Else check if available_cells is empty which means the board is full and nobody won, then break loop
  if win?(player1)
    puts 'Hurray! Player 1 has won'
  elsif available_cells.empty?
    puts 'Its a draw.'
  end
  break if win?(player1) || available_cells.empty?

  # Input Player 2
  puts 'Player 2, select a cell from the above board'
  player2_move = gets.chomp.to_i
  # Check if Player 2 is trying to put a cell no. that is already filled
  # If yes, then display an error message and ask Player 2 to retry
  until available_cells.include?(player2_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player2_move = gets.chomp.to_i
  end
  # Else add player2_move to player1 array
  player2 << player2_move
  # Then delete that cell no. from available_cells array
  available_cells.delete(player2_move)
  # Now the board is displayed with Player 2's move i.e. O in the given cell no.
  # by calling the display_board method with player2 array as the argument
  display_board(player2)
  # Check if Player 2 won
  # If yes, display message and break loop
  # Else check if available_cells is empty which means the board is full and nobody won, then break loop
  if win?(player2)
    puts 'Hurray! Player 2 has won'
  elsif available_cells.empty?
    puts 'Its a draw.'
  end
  break if win?(player2) || available_cells.empty?
end

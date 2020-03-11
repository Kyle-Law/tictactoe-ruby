class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def board_config(player, move)
    @board[@board.index(move)] = 'X' if player == 'X'
    @board[@board.index(move)] = 'O' if player == 'O'
  end

  def display_board
    <<~MLS
       #{@board[0]} | #{@board[1]} | #{@board[2]}
      ---+---+---
       #{@board[3]} | #{@board[4]} | #{@board[5]}
      ---+---+---
       #{@board[6]} | #{@board[7]} | #{@board[8]}
    MLS
  end
end

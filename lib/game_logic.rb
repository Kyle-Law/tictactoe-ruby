class TicTacToe

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2

        @available_cells = [1,2,3,4,5,6,7,8,9]
        @board = [1,2,3,4,5,6,7,8,9]
        @playerX_cells = []
        @playerO_cells = []
        
    end
  
    def display_rule
      rule = "Rule: #{@player1} gets the first chance to select a cell from the board. \nThen #{@player2} can select a cell. Selection of cell is done by the cell number."
    end
  
    def valid_input?(input)
      @available_cells.include?(input)
    end
  
    def player_move(player, move)
      @playerX_cells << move if player == "X"
      @playerO_cells << move if player == "O"
      @board[@board.index(move)] = "X" if player == "X"
      @board[@board.index(move)] = "O" if player == "O"
      @available_cells.delete(move)
    end
  
    def display_board
      board = " #{@board[0]} | #{@board[1]} | #{@board[2]} \n---+---+---\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n---+---+---\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def win?(player)
      winning_condition = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
      cells = player == "X" ? @playerX_cells : @playerO_cells 
      winning_condition.any? do |cond|
        (cells & cond).length == 3
      end
    end
    
    def draw?
      @available_cells.empty?
    end

    def play
        
    end
  end
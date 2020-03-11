class Player
  attr_accessor :player1_cells, :player2_cells
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @player1_cells = []
    @player2_cells = []
  end

  def player_move(player, move)
    @player1_cells << move if player == 'X'
    @player2_cells << move if player == 'O'
  end
end
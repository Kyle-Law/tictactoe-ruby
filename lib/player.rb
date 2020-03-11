class Player
  attr_accessor :cells
  
  def initialize
    # @player1_cells = []
    # @player2_cells = []
    @cells = []
  end

  def move(move)
    @cells << move
    # @player1_cells << move if player == 'X'
    # @player2_cells << move if player == 'O'
  end
end

# kyle = Player.new => my_array(my_cells) = [], kyle.player_move(5) , my_cells << 5
# tirtha = Player.new => [] , tirtha.move
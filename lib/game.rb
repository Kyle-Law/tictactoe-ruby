class Game
  attr_accessor :available_cells
  
  def initialize
    @available_cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def valid_input?(input)
    @available_cells.include?(input)
  end

  def delete_available_cells(move)
    @available_cells.delete(move)
  end

  def win?(array)
    winning_condition = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    winning_condition.any? do |cond|
      (array & cond).length == 3
    end
  end

  def draw?
    @available_cells.empty?
  end
end
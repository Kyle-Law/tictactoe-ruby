class Player
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def move(move)
    @cells << move
  end
end

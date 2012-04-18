class ComputerPlayer

  attr_accessor :ai
  attr_accessor :symbol
  
  def initialize(symbol)
    @ai = Ai.new
    @symbol = symbol
  end
  
  def get_move(board)
    move = @ai.move(board)
    return move
  end
end
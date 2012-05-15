require 'ai'

class ComputerPlayer < Player
  attr_accessor :ai

  def initialize(symbol)
    @ai = Ai.new
    @symbol = symbol
  end
  
  def get_move(board)
    sleep 0.5
    # @ai.random_move(board)    
    @ai.get_minimax_move(board)
  end
end
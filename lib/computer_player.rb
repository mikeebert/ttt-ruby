require 'ai'

class ComputerPlayer < Player
  attr_accessor :ai

  def initialize(symbol)
    @ai = Ai.new
    @symbol = symbol
  end
  
  def get_move(board)
    @ai.random_move(board)
  end
end
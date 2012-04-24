require 'ai'

class ComputerPlayer < Player
  attr_accessor :ai

  def initialize(symbol)
    @ai = Ai.new
    @symbol = symbol
  end
  
  def get_move(board)
    puts "Thinking...\n"
    # @ai.random_move(board)
    @ai.get_minimax_move(board)
  end
end
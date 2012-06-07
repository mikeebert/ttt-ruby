require 'ai'

module TTT
  class ComputerPlayer
    attr_accessor :ai,:symbol

    def initialize(symbol)
      @ai = Ai.new
      @symbol = symbol
    end
    
    def human?
      false
    end
  
    def get_move(board)
      sleep 0.5
      # @ai.random_move(board)    
      @ai.get_minimax_move(board)
    end
  end
end

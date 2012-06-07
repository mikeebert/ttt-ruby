module TTT
  class MockComputer
    attr_accessor :ai, :symbol
    attr_accessor :received_move_request
    
    def get_move(board, player, opponent)
      @received_move_request = true
    end
    
    def human?
      false
    end
    
  end
end
module TTT
  class MockComputer
    attr_accessor :ai, :symbol
    attr_accessor :received_move_request
                      
    def get_move(board)
      @received_move_request = true
      return @move
    end
  end
end
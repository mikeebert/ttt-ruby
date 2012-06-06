module TTT
  class HumanPlayer 
    attr_accessor :symbol, :ui
  
    def initialize(symbol, ui)
      @ui = ui
      @symbol = symbol
    end
  
    def get_move(board)
      @ui.prompt_for_next_move
      sleep 0.1
      move = @ui.get_input
      if board.valid_move(move)
        return move
      else      
        @ui.invalid_move_message
        get_move(board)
      end
    end  

    def move(board)
      move = self.get_move(board)
      board.place_move(@symbol, move)
    end
  end
end

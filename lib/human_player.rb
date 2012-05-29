module TTT
  class HumanPlayer < Player
    attr_accessor :ui
  
    def initialize(symbol, ui)
      @ui = ui
      @symbol = symbol
    end
  
    def get_move(board)
      @ui.prompt_for_next_move
      sleep 0.3
      move = @ui.get_input
      if board.valid_move(move)
        return move
      else      
        @ui.invalid_move_message
        get_move(board)
      end
    end  
  end
end
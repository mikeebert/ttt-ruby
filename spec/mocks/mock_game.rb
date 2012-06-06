class FakeGame
  
  attr_accessor :board,
                :board_player1_symbol,
                :board_player2_symbol,
                :created_board,
                :over  
  
  def create_board(size)
    @created_board = true
  end
  
  def set_board_symbols(symbol1,symbol2)
    @board_player1_symbol = symbol1
    @board_player2_symbol = symbol2
  end
  
  def current_board
    @board    
  end
  
  def is_over?
    return @over
  end
end

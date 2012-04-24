class FakeAi

  attr_accessor :received_board, :move
  
  def move(board)
    @received_board = true
    return @move
  end
  
  def random_move(board)
    @received_board = true
    return @move
  end
  
  def get_minimax_move(board)
    @received_board = true
    return @move    
  end

end
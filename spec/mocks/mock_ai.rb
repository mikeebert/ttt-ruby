class FakeAi

  attr_accessor :received_board, :move
  
  def random_move(board)
    @received_board = true
    return @move
  end
  
  def get_minimax_move(board, player, opponent)
    @received_board = true
    return @move    
  end

end
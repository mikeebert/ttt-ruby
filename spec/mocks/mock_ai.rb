class FakeAi

  attr_accessor :received_board
  attr_accessor :move
  
  def move(board)
    @received_board = true
    return @move
  end

end
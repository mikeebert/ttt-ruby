class FakeAi

  attr_accessor :received_board
  
  def move(board)
    @received_board = true
  end

end
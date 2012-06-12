class MockLimelightGame

  attr_accessor :received_move
  
  def update_game(n)
    @received_move = true
  end
end
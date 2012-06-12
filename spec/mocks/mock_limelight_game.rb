class MockLimelightGame

  attr_accessor :game_reset, :received_move
  
  def update_game(n)
    @received_move = true
  end
  
  def reset_game
    @game_reset = true
  end
end
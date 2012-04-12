class FakePlayer
  
  attr_accessor :ui
  attr_accessor :ai
  attr_accessor :type
  attr_accessor :symbol
  attr_accessor :game_delegated_for_type_of_player
  
  def set_type_of_player(n)
    @game_delegated_for_type_of_player = true
  end
  
  def move(board)
  end
  
end
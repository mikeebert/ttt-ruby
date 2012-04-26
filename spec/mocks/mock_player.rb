class FakePlayer
  attr_accessor :ui,
                :ai,
                :type,
                :symbol,
                :game_delegated_for_type_of_player
  
  def set_type_of_player(n)
    @game_delegated_for_type_of_player = true
    @symbol = n
  end
  
  def move(board)
  end
  
end
require 'player'

class FakeHuman < Player
  attr_accessor :created_new_player
  attr_accessor :received_move_request
  
  def initialize
    @created_new_player = true
  end
  
  def get_move(board)
    @received_move_request = true
  end
end
require 'player'
require 'mocks/mock_ui'

class FakeHuman < TTT::Player
  attr_accessor :created_new_player
  attr_accessor :received_move_request
  attr_accessor :ui
  
  def initialize
    @created_new_player = true
    @ui = FakeUI.new
  end
  
  def get_move(board)
    @received_move_request = true
  end
end
require 'player'
require 'mocks/mock_ui'

module TTT
  class MockHuman
    attr_accessor :created_new_player
    attr_accessor :received_move_request
    attr_accessor :move
    attr_accessor :symbol, :ui
  
    def initialize
      @created_new_player = true
      @ui = FakeUI.new
    end
    
    def human?
      true      
    end  
    
    def get_move(board)
      @received_move_request = true
      return @move
    end
  end
end
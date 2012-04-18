require 'player'
require 'mocks/mock_ui'
require 'mocks/mock_board'

describe "The Player Class" do
  
  before(:each) do
    @player1 = Player.new
    @player2 = Player.new
    @ui = FakeUI.new
    @player1.ui = @ui
    @player2.ui = @ui
  end
  

  describe "getting a move" do
    
    it "should get a move based on the type of player it is" do
      
    end
  end

end


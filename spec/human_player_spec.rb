require 'player'
require 'human_player'
require 'mocks/mock_ui'
require 'mocks/mock_board'

module TTT
  describe HumanPlayer do  
    before(:each) do
      @human = HumanPlayer.new("x")
    end

    it "should have a symbol" do
      @human.symbol.should == "x"
    end
    
    it "should return true if asked if it's a human player" do
      @human.human?.should == true
    end
  end
end
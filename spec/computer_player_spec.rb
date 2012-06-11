require 'computer_player'
require 'mocks/mock_ai'
require 'mocks/mock_board'

module TTT
  describe ComputerPlayer do
    before(:each) do
      @computer = ComputerPlayer.new("X")
      @board = FakeBoard.new
      @ai = FakeAi.new
      @computer.ai = @ai
    end
  
    it "should have a symbol and know it's not human" do
      @computer.symbol.should == "X"
      @computer.human?.should == false
    end
  
    it "should get a move from the Ai" do
      @ai.move = :valid_move
      @computer.get_ai_move(@board, :player, :opponent).should == :valid_move
    end
  end
end
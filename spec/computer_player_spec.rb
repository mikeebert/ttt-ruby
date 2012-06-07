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
  
    it "should respond to the move method from the Player superclass by asking the ai for a move" do
      @computer.move(@board)
      @ai.received_board.should == true
    end
  
    it "should send the move and it's symbol to a board via the Player move method" do
      @ai.move = :valid_move
      @computer.move(@board)
      @board.received_symbol.should == ("X")
      @board.received_move.should == :valid_move
    end
  
    it "should get a move from the Ai" do
      @ai.move = :valid_move
      @computer.get_move(@board).should == :valid_move
    end
  end
end
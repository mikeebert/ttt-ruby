require 'ai'
require 'board'
require 'mocks/mock_board'

describe "playing through moves" do
  before(:each) do
    @computer = ComputerPlayer.new("X")
    @board = Board.new(3)
  end

  it "should return a move from the list of available spaces" do
    @ai.move = [1,2,3,4]
    @board.spaces_values.should include(@ai.get_move(@board))
  end
  
  it "should create a new hash of the possible moves" do
    @computer.get_minimax_move(@board)
    @computer.possible_moves.should == {}
  end    
end

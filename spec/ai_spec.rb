require 'ai'
require 'mocks'

describe "the computer AI" do
  before(:each) do
    @ai = Ai.new
    @board = FakeBoard.new
  end
  
  it "should return a position to move on the board" do
    @board.spaces_values = [1]
    @ai.move(@board).should == 1    
  end

  describe "a random move" do
        
    it "should ask the board for available spaces"  do
      @ai.random_move(@board)
      @board.provided_spaces.should == true
    end

    it "should pull a random value from the available spaces" do
      @board.spaces_values = [1,2]
      @ai.random_move(@board).should == 1 || 2
      @ai.random_move(@board).should_not == 3
    end

  end
  

end
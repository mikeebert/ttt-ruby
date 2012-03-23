require 'ai'
require 'mocks'

describe "the computer AI" do
  before(:each) do
    @ai = Ai.new
    @board = FakeBoard.new
  end
  
  it "should make a move on a board" do
    @ai.move(@board)
    @board.made_computer_move.should == true
  end

  describe "a random move" do
    before(:each) do
      @ai.random_move(@board)
    end
    
    it "should ask the board for available spaces"  do
      @board.provided_spaces.should == true
    end

    it "should pull a random value from the available spaces" do
      @board.spaces_values.should == [:valid_move]
    end

    it "should make a random move on a board" do
      @board.made_computer_move.should == true
    end
  end
  

end
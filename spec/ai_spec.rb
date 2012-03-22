require 'ai'

describe "the computer AI" do
  
  before(:each) do
    @ai = Ai.new
    @board = Board.new(3)
    @board.computer_symbol = "o"
  end

  it "should make a random move on a board" do
    @ai.move(@board)
    @board.move_count.should == 1
  end
  
  it "should make two random moves" do
    @ai.random_move(@board)
    @ai.random_move(@board)
    @board.move_count.should == 2
  end
  
  it "should make random moves to fill the board" do
    @ai.random_move(@board)
    @ai.random_move(@board)
    @ai.random_move(@board)
    @ai.random_move(@board)
    @ai.random_move(@board)
    @ai.random_move(@board)    
    @ai.random_move(@board)
    @ai.random_move(@board)
    @ai.random_move(@board)    
    @board.move_count.should == 9
  end
  
end
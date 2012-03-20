require 'ai'

describe "the computer AI" do
  
  before(:each) do
    @board = Board.new(3)
    @board.computer_symbol = "o"
  end

  it "should make a random move on a board" do
    Ai.move(@board)
    @board.move_count.should == 1
  end
  
  it "should make two random moves" do
    Ai.random_move(@board)
    Ai.random_move(@board)
    @board.move_count.should == 2
  end
  
  it "should make random moves to fill the board" do
    Ai.random_move(@board)
    Ai.random_move(@board)
    Ai.random_move(@board)
    Ai.random_move(@board)
    Ai.random_move(@board)
    Ai.random_move(@board)    
    Ai.random_move(@board)
    Ai.random_move(@board)
    Ai.random_move(@board)    
    @board.move_count.should == 9
  end
  
end
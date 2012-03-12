require 'board.rb'

describe "the tic tac toe board" do

  it "should have an array of arrays representing the size of the board" do
    board = Board.new(3)
    board.grid.flatten.count.should == 9
    board = Board.new(5)
    board.grid.flatten.count.should == 25
  end

  
end
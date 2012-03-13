require 'board.rb'

describe "the tic tac toe board" do
  
  before(:each) do
    @board = Board.new(3)
    @grid = @board.grid 
  end

  it "should have an array of arrays representing the size of the grid" do
    @grid.flatten.count.should == 9
    @board = Board.new(5)
    @board.grid.flatten.count.should == 25
  end

  it "should have values from 1 to n representing locations on the grid" do
    @grid[0][0].should == 1
    @grid[2][2].should == 9
  end
  
  it "should check to see if a move is valid on the grid" do
    @board.valid_move(1).should == true
    @board.valid_move(10).should == false
  end
  
  it "should say a move is invalid if that space is already taken" do
    @grid[0][0] = "x"
    @board.valid_move(1).should == false
    @grid[2][2] = "x"
    @board.valid_move(9).should == false
  end
  
  it "should know if a space has already been taken" do
    @grid[0][0] = "x"
    @grid[1][1] = "o"
    @board.space_available?(1).should == false   
    @board.space_available?(5).should == false
    @board.space_available?(9).should == true
  end
  
  it "should know the coordinates of a move" do
    @board.coordinates_of(1).should == [0,0]
    @board.coordinates_of(9).should == [2,2]
  end
    
end
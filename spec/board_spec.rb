require 'board'

describe "the tic tac toe board" do
  
  before(:each) do
    @board = Board.new(3)
    @board.human_symbol = "x"
    @board.computer_symbol = "o"
    @grid = @board.grid 
  end
  
  it "should know how the size of itself" do
    @board.size.should == 9
    @board = Board.new(9)
    @board.size.should == 81
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

  it "should allow any letter to exist for a player symbol" do
    @board.human_symbol = "X"
    @board.human_symbol.should == "X"
    @board.human_symbol.should_not == "x"
  end
  
  it "should allow any letter to exist for a computer symbol" do
    @board.computer_symbol = "X"
    @board.computer_symbol.should == "X"
    @board.computer_symbol.should_not == 9
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
    @board.coordinates_of(1).should == {row: 0, column: 0}
    @board.coordinates_of(9).should == {row: 2, column: 2}
  end
   
  it "should know how many moves are on the board" do
    @grid[0][0] = "x"
    @grid[1][0] = "x"
    @grid[2][0] = "o"
    @board.move_count.should == 3    
  end
   
  it "should place a human move on the board" do
    @board.place_human_move(1)
    @board.place_human_move(7)
    @grid[0][0].should == "x"
    @grid[2][0].should == "x"
  end
  
  it "should place a computer move on the board" do
    @board.place_computer_move(1)
    @board.place_computer_move(4)
    @grid[0][0].should == "o"  
    @grid[1][0].should == "o"  
  end

  it "should check for a row of the same symbols" do
    @grid[0][0] = "x"
    @grid[0][1] = "x"
    @grid[0][2] = "x"
    @board.has_winner.should == true
  end
   
  it "should check for a column of the same symbols" do
    @grid[0][0] = "x"
    @grid[1][0] = "x"
    @grid[2][0] = "x"
    @board.has_winner.should == true
  end
  
  it "should check for a vertical winner in the last row" do
    @grid[0][2] = "x"
    @grid[1][2] = "x"
    @grid[2][2] = "x"
    @board.has_winner.should == true    
  end
   
  it "should not say there is a winner if there isn't one" do
    @board.place_human_move(1)
    @board.place_human_move(2)
    @board.has_winner.should_not == true
  end
    
  it "should check for a draw" do
    [1,3,6,7,8].each {|n| @board.place_human_move(n)}
    @grid[0][1] = "o" #fake computer moves
    @grid[1][0] = "o"   
    @grid[1][1] = "o"   
    @grid[2][2] = "o"   
    @board.is_draw.should == true
  end
  
  it "should not return a draw when a player wins" do
    @board.place_human_move(1)
    @board.place_human_move(2)
    @board.place_human_move(3)
    @board.is_draw.should == false
  end
    
  it "should return an array of available spaces to play in" do
    @grid[0][0] = "x"
    @board.available_spaces.should == [2,3,4,5,6,7,8,9]
  end
    
  it "should check for a forward-slash diagonal win" do
    @board.place_human_move(1)
    @board.place_human_move(5)
    @board.place_human_move(9)
    @board.has_winner.should == true    
  end

  it "should check for a backward-slash diagonal win" do
    @board.place_human_move(3)
    @board.place_human_move(5)
    @board.place_human_move(7)
    @board.has_winner.should == true    
  end
  

  
end
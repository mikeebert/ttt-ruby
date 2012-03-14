require 'game'

describe "the tic tac toe game" do
  
  before(:each) do
    @game = Game.new(3)
  end
  
  it "should allow any letter to exist for a player symbol" do
    @game.human_symbol = "X"
    @game.human_symbol.should == "X"
    @game.human_symbol.should_not == "x"
  end
  
  it "should allow any letter to exist for a player symbol" do
    @game.computer_symbol = "X"
    @game.computer_symbol.should == "X"
    @game.computer_symbol.should_not == 9
  end
  
  it "should allow a move to replace a value on the board" do
    @game.human_move(1)
    @game.human_move(9)
    @game.board.grid[0][0].should == "x"
    @game.board.grid[2][2].should == "x"
  end
  
  it "should check for a draw" do
    [1,3,6,7,8].each {|n| @game.human_move(n)}
    @game.board.grid[0][1] = "o" #fake computer moves
    @game.board.grid[1][0] = "o"   
    @game.board.grid[1][1] = "o"   
    @game.board.grid[2][2] = "o"   
    @game.draw?.should == true
  end

  it "should not return a draw when a player wins" do
    @game.human_move(1)
    @game.human_move(2)
    @game.human_move(3)
    @game.draw?.should == false
  end
  
  it "should make a random move in response to 2 player moves" do
    @game.human_move(5)
    @game.computer_move
    @game.human_move(2)
    @game.computer_move
    @game.board.move_count.should == 4
  end
  
  it "should make random moves to fill the board" do
    @game.human_move(1)
    @game.computer_move
    @game.human_move(2)
    @game.computer_move
    @game.computer_move
    @game.computer_move
    @game.computer_move
    @game.computer_move
    @game.computer_move
    @game.board.move_count.should == 9
  end

end
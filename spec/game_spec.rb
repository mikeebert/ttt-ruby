require 'game'

describe "the tic tac toe game" do
  
  before(:each) do
    @game = Game.new(3)
    @game.board.human_symbol = "x"
    @game.board.computer_symbol = "o"
  end
  
  it "should have a board based on the initial size passed to it" do
    @game.board.grid.count.should == 3 #doesn't feel right that the game knows about the board, the grid and that i can count it
  end
  
  it "should allow a human to make a move on the board" do
    @game.human_move(1)
    @game.human_move(9)
    @game.board.grid[0][0].should == "x"
    @game.board.grid[2][2].should == "x"
  end
  
  
  it "should make a computer move" do
    @game.computer_move
    @game.board.move_count.should == 1
  end
  

  # it "should check for a draw" do
  #   [1,3,6,7,8].each {|n| @game.human_move(n)}
  #   @game.board.grid[0][1] = "o" #fake computer moves
  #   @game.board.grid[1][0] = "o"   
  #   @game.board.grid[1][1] = "o"   
  #   @game.board.grid[2][2] = "o"   
  #   @game.draw?.should == true
  # end
  # 
  # it "should not return a draw when a player wins" do
  #   @game.human_move(1)
  #   @game.human_move(2)
  #   @game.human_move(3)
  #   @game.draw?.should == false
  # end


end
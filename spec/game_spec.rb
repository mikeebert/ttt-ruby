require 'game'

describe "the tic tac toe game" do
  
  before(:each) do
    @game = Game.new(3)
    @game.board.human_symbol = "x"
    @game.board.computer_symbol = "o"
  end
  
  it "should have a board based on the initial size passed to it" do
    @game.board.grid.count.should == 3 
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
  
  it "should not allow a human to make a move in a space that is already taken" 
    # @game.human_move(1)
    # @game.human_move(1).should == nil

  


  it "should send a response after a computer move"
    # @game.computer_move_response.should == true

end
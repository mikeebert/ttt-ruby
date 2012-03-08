require 'game.rb'

describe "a tic tac toe game" do
  
  before(:each) do
    @game = Game.new
  end
  
  it "should have an array of three arrays representing a board" do
    @game.board.count == 3    
  end
  
  it "should have values of 1 through 9 representing the positions on the board" do
    @game.board[0][0].should == 1
    @game.board[2][2].should == 9
  end

  it "should allow a move to replace a value on the board" do
    @game.player_move(1)
    @game.player_move(9)
    @game.board[0][0].should == "X"
    @game.board[2][2].should == "X"
  end

  it "should check if a move is a valid entry" do
    @game.player_move(15).should == nil
    @game.player_move("blah").should == nil
  end
  
  it "should check that a move isn't already taken on the board" do
    @game.player_move(1)
    @game.player_move(1).should == nil
  end
  
  it "should check for a horizontal win" do
    @game.player_move(1)
    @game.player_move(2)
    @game.player_move(3)
    @game.win?.should == true
  end
  
  it "should check for a vertical win" do
    @game.player_move(1)
    @game.player_move(4)
    @game.player_move(7)
    @game.win?.should == true
  end
  
  it "should check for a forward-slash diagonal win" do
    @game.player_move(1)
    @game.player_move(5)
    @game.player_move(9)
    @game.win?.should == true    
  end
  
  it "should check for a back-slash win" do
    @game.player_move(3)
    @game.player_move(5)
    @game.player_move(7)
    @game.win?.should == true
  end
  
  it "should check for a draw" do
    [1,3,6,7,8].each {|n| @game.player_move(n)}
    @game.board[0][1] = "O" #fake computer moves
    @game.board[1][0] = "O"   
    @game.board[1][1] = "O"   
    @game.board[2][2] = "O"   
    @game.draw?.should == true
  end
  
  it "should know how many moves are in a game" do
    @game.player_move(1)
    @game.player_move(2)
    @game.player_move(3)
    @game.player_move(4)
    @game.move_count.should == 4
  end
  
  it "should make a computer move in an open center square for the first move" do
    @game.player_move(1)
    @game.computer_move
    @game.board[1][1].should == "O"
  end
  
  it "should make a computer move in the upper left corner if the center is taken" do
    @game.player_move(5)
    @game.computer_move
    @game.board[1][1].should
  end
  
  #only tests for one knight set-up
  describe "protect against the knight set-up" do
    it "should protect against a knight (l-shaped) set-up" do
      @game.player_move(1)
      @game.computer_move
      @game.player_move(8)
      @game.computer_move
      @game.board[2][0].should == "O"
    end    
  end
  
  it "should protect against the diagonal edge set-up" do
    @game.player_move(2)
    @game.computer_move
    @game.player_move(4)
    @game.computer_move
    @game.board[0][0].should == "O"
  end
  
  it "should protect against the double-edge setup"

end
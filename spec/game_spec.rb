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
    @game.board[0][0].should == "x"
    @game.board[2][2].should == "x"
  end

  it "should check if a move is a valid entry" do
    @game.valid_move(15).should == false
    @game.valid_move("blah").should == false
  end
  
  it "should check that a move isn't already taken on the board" do
    @game.player_move(1)
    @game.valid_move(1).should == false
  end
  
  it "should check for a horizontal win" do
    @game.player_move(1)
    @game.player_move(2)
    @game.player_move(3)
    @game.winner?.should == true
  end
  
  it "should check for a vertical win" do
    @game.player_move(1)
    @game.player_move(4)
    @game.player_move(7)
    @game.winner?.should == true
  end
  
  it "should check for a forward-slash diagonal win" do
    @game.player_move(1)
    @game.player_move(5)
    @game.player_move(9)
    @game.winner?.should == true    
  end
  
  it "should check for a back-slash win" do
    @game.player_move(3)
    @game.player_move(5)
    @game.player_move(7)
    @game.winner?.should == true
  end
  
  it "should check for a draw" do
    [1,3,6,7,8].each {|n| @game.player_move(n)}
    @game.board[0][1] = "o" #fake computer moves
    @game.board[1][0] = "o"   
    @game.board[1][1] = "o"   
    @game.board[2][2] = "o"   
    @game.draw?.should == true
  end

  it "should not return a draw when a player wins" do
    @game.player_move(1)
    @game.player_move(2)
    @game.player_move(3)
    @game.draw?.should == false
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
    @game.board[1][1].should == "o"
  end
  
  it "should make a computer move in the upper left corner if the center is taken" do
    @game.player_move(5)
    @game.computer_move
    @game.board[0][0].should == "o"
  end
  
  it "should make a random move in response to 2 player moves" do
    @game.player_move(5)
    @game.computer_move
    @game.player_move(2)
    @game.computer_move
    @game.move_count.should == 4
  end
  
  it "should make random moves to fill the board" do
    @game.player_move(1)
    @game.computer_move
    @game.player_move(2)
    @game.computer_move
    @game.random_move
    @game.random_move
    @game.random_move
    @game.random_move
    @game.random_move
    @game.move_count.should == 9
  end
  
  # it "should make the first available move" do
  #   @game.player_move(5)
  #   @game.computer
  # end
  
  #only tests for one knight set-up
  # describe "protect against the knight set-up" do
  #   it "should protect against a knight (l-shaped) set-up" do
  #     @game.player_move(1)
  #     @game.computer_move
  #     @game.player_move(8)
  #     @game.computer_move
  #     @game.board[2][0].should == "o"
  #   end    
  # end

  # removed the test below while I spiked through the UI.
  # it "should protect against the diagonal edge set-up" do
  #   @game.player_move(2)
  #   @game.computer_move
  #   @game.player_move(4)
  #   @game.computer_move
  #   @game.board[0][0].should == "o"
  # end
  
  # it "should protect against the double-edge setup"

end
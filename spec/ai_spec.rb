require 'ai'

describe "the computer AI" do

  it "should make a random move on a board" do
    board = Board.new(3)
    Ai.random_move(board)
    board.move_count.should == 1
  end
  
  it "should make two random moves" do
    board = Board.new(3)
    Ai.random_move(board)
    Ai.random_move(board)
    board.move_count.should == 2
  end

  # it "should make a computer move in an open center square for the first move"
  #   @game.human_move(1)
  #   @game.computer_move
  #   @game.board.grid[1][1].should == "o"
  # end
  
  # it "should make a computer move in the upper left corner if the center is taken"
  #   @game.human_move(5)
  #   @game.computer_move
  #   @game.board.grid[0][0].should == "o"
  # end
  
  # it "should make the first available move" do
  #   @game.human_move(5)
  #   @game.computer
  # end

  #only tests for one knight set-up
  # describe "protect against the knight set-up" do
  #   it "should protect against a knight (l-shaped) set-up" do
  #     @game.human_move(1)
  #     @game.computer_move
  #     @game.human_move(8)
  #     @game.computer_move
  #     @game.board[2][0].should == "o"
  #   end    
  # end
  
end
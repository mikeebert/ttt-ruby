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

  # it "should make a computer move in an open center square for the first move"

  
  # it "should make a computer move in the upper left corner if the center is taken"

  # it "should make the first available move" do

  #only tests for one knight set-up
  # describe "protect against the knight set-up" do
  #   it "should protect against a knight (l-shaped) set-up" do
  
end
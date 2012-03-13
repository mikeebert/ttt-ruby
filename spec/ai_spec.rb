require 'ai'

describe "the computer AI" do

  it "should make a random move on a board" do
    @board = Board.new(3)
    Ai.computer_move
    @board.move_count.should == 1
  end

end
require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'ai'

describe "a computer's move on a tic tac toe board" do

  it "should make a move on a board" do
    @board = Board.new(3)
    @ai.computer_move
    @board.move_count.should == 1
  end

end
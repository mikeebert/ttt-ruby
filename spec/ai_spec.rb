# Game passes Ai a Board.
#   - Board has a next_player (that is the Ai)
#   - Board has available_spaces the Ai can move to
# 
# The Ai calculates it's best move and makes it.
#  - In order to do that the AI places all the moves and then sends the results of those moves (the board and the original move) back to the method it is in.
#  - If any of those moves result in a win, that move is ranked highest (100) and the AI takes it. (if there are more than one immediate wins from a move the Ai will just take the first one)
#  - If none of those games result in a win or a draw, then the Ai passes all of those boards (board and original move) back to the "mock" second player (a.k.a "Min") for Min to make it's best move.
#  - The min Ai takes all of the available moves and passes those boards and the original move back to the same method for ranking. If it results in a win for Min then Min ranks it highest (i.e. 100) as such and will take it.
#  - If none of those games result in a win or draw then the boards and the original move are passed back to the Ai and Max takes the best available moves... a win at this depth of the game tree is ranked lower than a win at the higher depth.

require 'ai'
require 'mocks'

describe "an ai move with the minimax algorithm" do

  before(:each) do
    @board = Board.new(3)
    @ai = Ai.new
  end
  
  it "should make a winning move for the max player" do
    @board.place_player1_move(1)
    @board.place_player2_move(5)
    @board.place_player1_move(7)
    @board.place_player2_move(4)
    @board.place_player1_move(2)
    @ai.move(@board)
    @board.grid[1][2].should == @board.player2_symbol
  end
  
  it "should take a winning move for the min player" do 
    @board.place_player1_move(1)
    @board.place_player2_move(5)
    @board.place_player1_move(2)
    @ai.move(@board)
    @board.grid[0][2].should == @board.player2_symbol
  end
  
  it "should take the first available spot in a draw" do
    @board.place_player1_move(1)
    @board.place_player2_move(5)
    @board.place_player1_move(8)
    @board.place_player2_move(7)
    @board.place_player1_move(2)
    @board.place_player2_move(3)
    @board.place_player1_move(6)
    @ai.move(@board)
    @board.grid[1][0].should == @board.player2_symbol
  end
  
  it "should protect against the L setup" do
    @board.place_player1_move(1)
    @board.place_player2_move(5)
    @board.place_player1_move(8)
    @ai.move(@board)
    @ai.display_outcomes
    puts @ai.best_move(@ai.possible_outcomes)
    @board.grid[2][0].should == @board.player2_symbol
  end
  
  it "should protect against an inverted L setup" do
    @board.place_player1_move(7)
    @board.place_player2_move(5)
    @board.place_player1_move(2)
    @ai.move(@board)
    @ai.display_outcomes
    puts @ai.best_move(@ai.possible_outcomes)
    @board.grid[0][0].should == @board.player2_symbol
  end
  
  
end



# describe "the computer AI" do
#   before(:each) do
#     @ai = Ai.new
#     @board = FakeBoard.new
#   end
#   
#   it "should return a position to move on the board" do
#     @board.spaces_values = [1]
#     @ai.move(@board).should == 1    
#   end
# 
#   describe "a random move" do
#         
#     it "should ask the board for available spaces"  do
#       @ai.random_move(@board)
#       @board.provided_spaces.should == true
#     end
# 
#     it "should pull a random value from the available spaces" do
#       @board.spaces_values = [1,2]
#       @ai.random_move(@board).should == 1 || 2
#       @ai.random_move(@board).should_not == 3
#     end
#   end
#   
# 
# end
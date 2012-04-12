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
require 'mocks/mock_board'

describe "an ai move with the minimax algorithm" do

  before(:each) do
  end
  
  
end

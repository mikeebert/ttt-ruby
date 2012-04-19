require 'ai'
require 'board'
require 'mocks/mock_board'

describe "playing through moves" do
  before(:each) do
    @ai = Ai.new
  end

  it "should return a move from the list of available spaces" do
    @board = FakeBoard.new
    @board.spaces_values = [1,2,3,4]
    move = @ai.random_move(@board)
    @board.spaces_values.should include(move)
  end
  
  describe "getting and ranking minimax moves" do
    before(:each) do
      @board = Board.new(3)
      @symbol = "X"
    end
    
    it "should create a new hash of the possible moves" do
      @ai.get_minimax_move(@board,@symbol)
      @ai.possible_moves.should == {}
    end
    
    describe "a possible win in one move" do
      before(:each) do
        @board.grid = [["X","O","X"],
                       ["X","X",6],
                       ["O",8,"O"]]        
      end
      
      it "should rank a win in one move as 100" do
        @ai.get_minimax_move(@board, "X")
        @ai.possible_moves[6].should == 100
      end

      it "should set the max_move to a win if possible" do
        @ai.get_minimax_move(@board, "X")
        @ai.max_move.should == 6
      end

      it "should know if a move is a win" do
        @ai.move_is_win(@board,8,"O").should == true
      end
    end
    
    it "should create a copy of a board" do
      new_board = @ai.copy(@board)
      new_board.grid.should == @board.grid
      new_board.next_player.should == @board.next_player
    end
  end
end

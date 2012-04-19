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
      @board.player1_symbol = "X"
      @board.player2_symbol = "O"
    end
    
    it "should set the min and max symbols from a board player1" do
      @board.next_player = :player1
      @ai.set_min_and_max_symbols(@board)
      @ai.max_symbol.should == "X"
      @ai.min_symbol.should == "O"
    end

    it "should set the min and max symbols from a board player2" do
      @board.next_player = :player2
      @ai.set_min_and_max_symbols(@board)
      @ai.max_symbol.should == "O"
      @ai.min_symbol.should == "X"
    end    
    
    describe "a possible win in one move" do
      before(:each) do
        @board.grid = [["X","O","X"],
                       ["X","X",6],
                       ["O",8,"O"]]
        @board.next_player = :player1
        @board.player1_symbol = "X"
        @board.player2_symbol = "O"
      end
      
      it "should rank a win in one move as 100" do
        @ai.get_minimax_move(@board)
        @ai.max_move[6].should == 100
      end

      it "should set the max_move to a win if possible" do
        @ai.get_minimax_move(@board)
        @ai.max_move.keys[0].should == 6
      end

      # it "should know if a move is a win" do
      #   @ai.move_is_win(@board,8,"O").should == true
      # end
      
      it "should return a win in one move as the best move" do
        move = @ai.get_minimax_move(@board)
        move.should == 6
      end
      
      it "it should return the block of an opponent as the best move if no win is possible" do
        @board.grid = [["X","O","X"],
                       [4,"O",6],
                       ["X","X","O"]]
        @board.next_player = :player2
        move = @ai.get_minimax_move(@board)
        move.should == 4
      end
      
      it "it should return the block of an opponent as the best move if no win is possible" do
        @board.grid = [["X","O",3],
                       [4,"X",6],
                       [7,8,9]]
        @board.next_player = :player2
        move = @ai.get_minimax_move(@board)
        puts "#{@ai.max_symbol}'s best move is #{@ai.max_move} \n"
        puts "#{@ai.min_symbol}'s best move is #{@ai.min_move} \n"
        move.should == 9
      end
      
    end
    
    it "should create a copy of a board" do
      new_board = @ai.copy(@board)
      new_board.grid.should == @board.grid
      new_board.next_player.should == @board.next_player
    end
  end
end

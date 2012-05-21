require 'ai'
require 'board'
require 'mocks/mock_board'

module TTT
  describe "setting up to play through minimax" do
    before(:each) do
      @ai = Ai.new
      @board = FakeBoard.new
    end
    
    it "should return a move from the list of available spaces on a board" do
      @board.spaces_values = [1,2,3,4]
      move = @ai.random_move(@board)
      @board.spaces_values.should include(move)
    end
  
    it "should set the min and max players and symbols" do
      @board.player1_symbol = "X"
      @board.player2_symbol = "O"
      @board.next_player = :player1
      @ai.set_min_and_max_players(@board)
      @ai.max.symbol.should == "X"
      @ai.min.symbol.should == "O"
    end
    
    it "should create a copy of a board" do
      new_board = @ai.copy(@board)
      new_board.grid.should == @board.grid
      new_board.next_player.should == @board.next_player
    end
  
    describe "ranking minimax moves" do
      before(:each) do
        @board = Board.new(3)
        @board.player1_symbol = "X"
        @board.player2_symbol = "O"
      end
    
      it "should return (Max win - depth) if the max player is the winner in one move" do
        @board.grid = [["X","X","X"],
                       [4,5,6],
                       [7,8,9]]
        @ai.set_min_and_max_players(@board)
        depth = 1
        @ai.game_value(@board, depth).should == 99
      end

      it "should return (Min win - depth) if the min player is the winner in the next move" do
        @board.grid = [["O","O","O"],
                       [4,5,6],
                       [7,8,9]]
        @ai.set_min_and_max_players(@board)
        depth = 1
        @ai.game_value(@board, depth).should == -99
      end    
    end
    
    describe "possible game scenarios" do
      before(:each) do
        @board = Board.new(3)
        @board.next_player = :player1
        @board.player1_symbol = "X"
        @board.player2_symbol = "O"
      end
    
      it "should return a win in one move as the only possible move" do
        @board.grid = [["X","O","X"],
                       ["X","X",6],
                       ["O",8,"O"]]
        @ai.get_minimax_move(@board).should == 6
      end

      it "it should return the block of an opponent as the best move" do
        @board.grid = [["X","O",3],
                       [4,"X",6],
                       [7,8,9]]
        @board.next_player = :player2
        move = @ai.get_minimax_move(@board)
        move.should == 9
      end
    
      it "should return the last available spot as the only possible move" do
        @board.grid = [["X","O",3],
                       ["X","X","O"],
                       ["O","X","O"]]
        @board.next_player = :player1
        move = @ai.get_minimax_move(@board)
        move.should == 3
      end
    
      it "should block an L set-up" do
        @board.grid = [["X",2,3],
                       [4,"O",6],
                       [7,"X",9]]
        @board.next_player = :player2
        @ai.get_minimax_move(@board)
        @ai.possible_moves.should == [4,6,7,9]
      end
    
      it "should block an edge set-up" do
        @board.grid = [[1,"X",3],
                       ["X","O",6],
                       [7,8,9]]
        @board.next_player = :player2
        @ai.get_minimax_move(@board)
        @ai.possible_moves.should == [1,3,7]
      end
    
      it "should choose the center after an opening corner" do
        @board.grid = [["X",2,3],
                       [4,5,6],
                       [7,8,9]]
        @board.next_player = :player2
        @ai.get_minimax_move(@board).should == 5      
      end
        
      it "should choose a corner or center as the opening move" do
        @board.grid = [[1,2,3],
                       [4,5,6],
                       [7,8,9]]
        @board.next_player = :player1
        move = @ai.get_minimax_move(@board)
        move.should be_odd
      end
    end
  end
end
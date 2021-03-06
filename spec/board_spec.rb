require 'board'
require 'mocks/mock_player'

module TTT
  describe Board do
    describe "the tic tac toe board" do

      before(:each) do
        @player1 = FakePlayer.new
        @player1.symbol = "X"
        @player2 = FakePlayer.new
        @player2.symbol = "O"
        @board = Board.new
      end


      it "should have an array of arrays representing the size of the grid" do
        @board.grid.flatten.count.should == 9
      end

      it "should know the size of itself" do
        @board.size.should == 9
      end

      it "should have values from 1 to n representing locations on the grid" do
        @board.grid[0][0].should == 1
        @board.grid[2][2].should == 9
      end

      # it "should check to see if a move is valid on the grid" do
      #   @board.valid_move(1).should == true
      #   @board.valid_move(10).should == false
      # end

      # it "should say a move is invalid if that space is already taken" do
      #   @board.grid[0][0] = @player1
      #   @board.valid_move(1).should == false
      #   @board.grid[2][2] = @player1
      #   @board.valid_move(9).should == false
      # end

      it "should know the coordinates of a move" do
        @board.coordinates_of(1).should == {row: 0, column: 0}
        @board.coordinates_of(9).should == {row: 2, column: 2}
      end

      it "should know how many moves are on the board" do
        @board.grid[0][0] = @player1
        @board.grid[1][0] = @player1
        @board.grid[2][0] = @player2
        @board.move_count.should == 3    
      end

      it "should place a player move on the board" do
        @board.place_move(@player1,1)
        @board.place_move(@player1,7)
        @board.grid[0][0].should == @player1
        @board.grid[2][0].should == @player1
      end

      it "should check for a row of the same symbols" do
        @board.grid[0][0] = @player1
        @board.grid[0][1] = @player1
        @board.grid[0][2] = @player1
        @board.has_winner.should == true
        @board.winning_symbol.should ==  @player1
      end

      it "should check for a column of the same symbols" do
        @board.grid[0][0] = @player2
        @board.grid[1][0] = @player2
        @board.grid[2][0] = @player2
        @board.has_winner.should == true
        @board.winning_symbol.should == @player2
      end

      it "should check for a vertical winner in the last column" do
        @board.grid[0][2] = @player1
        @board.grid[1][2] = @player1
        @board.grid[2][2] = @player1
        @board.has_winner.should == true
        @board.winning_symbol.should == @player1
      end

      it "should check for a forward-slash diagonal win" do
        @board.place_move(@player1,1)
        @board.place_move(@player1,5)
        @board.place_move(@player1,9)
        @board.has_winner.should == true
        @board.winning_symbol.should == @player1
      end

      it "should check for a backward-slash diagonal win" do
        @board.place_move(@player1,3)
        @board.place_move(@player1,5)
        @board.place_move(@player1,7)
        @board.has_winner.should == true
        @board.winning_symbol.should == @player1
      end

      it "should not say there is a winner if there isn't one" do
        @board.place_move(@player1,1)
        @board.place_move(@player1,2)
        @board.has_winner.should_not == true
        @board.winning_symbol.should == nil
      end

      it "should check for a draw" do
        [1,3,6,7,8].each {|n| @board.place_move(@player1,n)}
        [2,4,5,9].each {|n| @board.place_move(@player2,n)}
        @board.is_draw.should == true
        @board.winning_symbol.should == nil
      end

      it "should not return a draw when a player wins" do
        @board.place_move(@player1,1)
        @board.place_move(@player1,2)
        @board.place_move(@player1,3)
        @board.is_draw.should == false
        @board.winning_symbol.should == nil
      end

      it "should return an array of available spaces to play in" do
        @board.grid[0][0] = @player1
        @board.available_spaces.should == [2,3,4,5,6,7,8,9]
      end

      it "should provide an array of player moves and blank spaces" do
        @board.grid = [["X",2,3],
                       ["X","O",6],
                       [7,8,9]]
        @board.moves.should == [["X","",""],
                                ["X","O",""],
                                ["","",""]]
      end

      it "should reset the board" do
        @board.place_move(@player1,1)
        old_grid = @board.grid
        @board.reset
        @board.grid.flatten.should_not == old_grid.flatten
        @board.winning_symbol.should == nil
      end
    end
  end
end

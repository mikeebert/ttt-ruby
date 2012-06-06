require 'game'
require 'mocks/mock_ui'
require 'mocks/mock_ai'
require 'mocks/mock_board'
require 'mocks/mock_player'
require 'mocks/mock_human'

module TTT
  describe Game do
    before(:each) do    
      @game = Game.new
      @game.ui = FakeUI.new
      @ui = @game.ui
      @board = FakeBoard.new
      @game.board = @board
    end
    
    it "should set the board symbols" do
      @game.set_board_symbols("X","O")
      @board.player1_symbol.should == "X"
      @board.player2_symbol.should == "O"
    end
    
    it "should return the next player based on the board" do
      @board.next_player = :player2
      @game.next_player.should == :player2
    end


  
    describe "playing the game" do      
      before(:each) do
        @player1 = MockHuman.new
        @player2 = MockHuman.new
        # @game.player1 = @player1
        # @game.player2 = @player2
        @board = FakeBoard.new
        @game.board = @board
        # @ui = FakeUI.new
        # @game.ui = @ui
        # @player1.ui = @ui
        # @player2.ui = @ui        
        # @ui.input_values = [:valid_move]
      end

      it "should know the game is over when the board returns a winner" do
        @board.game_won = true
        @game.is_over?.should == true
      end 

      it "should know the game is over when the board returns a draw" do
        @board.is_draw = true
        @game.is_over?.should == true
      end

      it "should know that the game is not over when there is no win or draw" do
        @board.is_draw = false
        @board.game_won = false
        @game.is_over?.should_not == true
      end

      # it "should send game over messages if a game is over" do
      #   @board.game_won = true
      #   @game.play_script
      #   @ui.message_contents.should include(:winner)
      # end
      # 
      # it "should not send a game over message if a game is not over" do
      #   @board.game_won = false
      #   @game.play_script
      #   @ui.message_contents.should_not include(:draw)
      #   @ui.message_contents.should_not include(:winner)
      # end

      # it "should not prompt a user for the next move if the game is over" do
      #   @board.game_won = true
      #   @game.play_script
      #   @ui.prompted_user.should_not == :next_move_please
      # end
    end

    # describe "the game over scenario" do
    #   before(:each) do
    #     @ui = FakeUI.new
    #     @ui.input_values = []
    #     @board = FakeBoard.new
    #     @game.ui = @ui
    #     @game.board = @board
    #   end
    #     
    #   it "should send a winning message if there is a winner" do
    #     @board.game_won = true
    #     @game.game_over_scenario
    #     @ui.message_contents.should include(:winner)
    #   end
    # 
    #   it "should send a draw message if a game is a draw" do
    #     @board.is_draw = true
    #     @game.game_over_scenario
    #     @ui.message_contents.should include(:draw)
    #   end
    #     
    #   it "should ask a user if they want to play again" do
    #     @game.game_over_scenario
    #     @ui.prompted_user.should == true
    #   end
    # 
    #   describe "asking a user to play again" do
    #     it "should delegate to the UI to ask about playing again" do
    #       @game.ask_to_play_again
    #       @ui.prompted_user.should == true
    #     end
    #   
    #     it "should return game exit if the user doesn't want to play again" do
    #       @ui.play_again = :no
    #       @game.exit_game.should == true
    #     end
    #   
    #     it "should not set the exit attribute if the ui input does't" do
    #       @ui.play_again = nil
    #       @game.exit_game.should == false
    #     end
    #   end
    # end
  end
end

require 'limelight_game'
require 'mocks/mock_player_factory'
require 'mocks/mock_game'
require 'mocks/mock_ui'
require 'mocks/mock_human'
require 'mocks/mock_computer'


module TTT
  describe LimelightGame do
    before(:each) do
      @ui = FakeUI.new
      @limelight_game = LimelightGame.new(@ui)    
      @game = FakeGame.new
      @limelight_game.game = @game
      @player_factory = MockPlayerFactory.new
      @limelight_game.player_factory = @player_factory
      player1_details = {type: :human, symbol: "X"}
      player2_details = {type: :computer, symbol: "O"}
      @limelight_game.create_players(player1_details,player2_details)
      @player1 = @limelight_game.player1
      @player2 = @limelight_game.player2
    end

    it "should send the details to the factory to set up the players" do
      @player_factory.player1_type.should == :human
      @player_factory.player1_symbol.should == "X"
      @player_factory.player2_type.should == :computer
      @player_factory.player2_symbol.should == "O"
    end
    
    it "should send the player symbols to the game" do
      @game.board_player1_symbol.should == "X"
      @game.board_player2_symbol.should == "O"
    end

    describe "#begin_game" do
      before(:each) do
        @game.over = true
      end
      
      it "should tell the UI to display a welcome message" do        
        @limelight_game.begin_game
        @ui.displayed_in_progress.should == true
      end
      
      it "should get a move from the computer if next player is computer" do
        @game.next_player = :player2
        @limelight_game.begin_game
        @player2.got_computer_move.should == true
      end
    end
    
    describe "#update_game" do
      before(:each) do
        @game.over = true
      end
      
      it "should send a move to the game" do
        @game.next_player = :player1
        @limelight_game.update_game(:some_move)
        @game.received_move_space.should == :some_move
      end
      
      it "should tell the ui to display the board" do
        @game.board = :some_board
        @limelight_game.update_game(:some_move)
        @ui.displayed_board.should == :some_board
      end
      
      it "should check if the game is over" do
        @limelight_game.update_game(:some_move)
        @game.checked_status.should == true
      end
      
      it "should send a winning message if there's a winner" do
        @game.board_winning_symbol = :some_winner
        @limelight_game.update_game(:some_move)
        @ui.displayed_winning_message.should == true
      end
      
      it "should send a draw message if there's a draw" do
        @limelight_game.update_game(:some_move)
        @ui.displayed_draw_message.should == true
      end
    end
    
    
  end
end

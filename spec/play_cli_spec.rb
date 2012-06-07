require 'play_cli'
require 'human_player'
require 'mocks/mock_game'
require 'mocks/mock_ui'
require 'mocks/mock_board'
require 'mocks/mock_human'
require 'mocks/mock_computer'

describe PlayCli do
  before(:each) do
    @ui = FakeUI.new
    @cli_runner = PlayCli.new(@ui)
    @game = FakeGame.new
    @cli_runner.game = @game
    @cli_runner.player_factory = @player_factory
    @ui.player_details = [{type: :human, symbol: "X"},
                          {type: :computer, symbol: "O"}]
  end

  describe "setting up the game" do
    before(:each) do
      @game.over = true
    end

    it "should create a new Game" do
      @cli_runner.ui.should == @ui
      @cli_runner.game.should == @game
    end


    it "should welcome the competitors" do
      @cli_runner.setup_game
      @ui.welcomed_competitors.should == true
    end

    it "should ask the ui to provide the type and symbol for a player" do
      @cli_runner.set_players
      @ui.requested_player_details.should == true
    end    
    
    it "should create a human player with the correct symbol" do
      @cli_runner.set_players
      @cli_runner.player1.symbol.should == "X"
      @cli_runner.player1.class.should == TTT::HumanPlayer
    end

    it "should create a computer player with the correct symbol" do
      @cli_runner.set_players
      @cli_runner.player2.symbol.should == "O"
      @cli_runner.player2.class.should == TTT::ComputerPlayer
    end

    it "should send the player symbols to the game for the board" do
      @game.over = true
      @cli_runner.setup_game
      @game.board_player1_symbol.should == "X"
      @game.board_player2_symbol.should == "O"
    end
  end
    
  describe "#play_game" do
    before(:each) do
      @game.board = :some_board
      @cli_runner.game.next_player = :player1
      @human = TTT::MockHuman.new
      @cli_runner.player1 = @human
    end

    it "should pass the Game's current board to the ui to display" do
      @game.over_values = [true]*2
      @cli_runner.play_game
      @ui.displayed_board.should == :some_board
    end
    
    it "should repeat the board display and next_player_move until the game is over" do
      @game.over_values = [false,false,false,false,false,true]
      @game.moves_made = 0
      @cli_runner.play_game
      @game.moves_made.should == 6
    end

    describe "#next_player_move" do 
    
      it "should get the next player from the game" do
        @game.next_player = :player1
        @cli_runner.next_player.should == @human
      end
    
      it "should prompt the ui to get a move from a human player" do
        @cli_runner.game.board_next_player = :player1
        @cli_runner.player1 = @human
        @cli_runner.next_player_move
        @ui.prompted_user.should == true
      end

      it "should get a move from a computer player" do
        @computer = TTT::MockComputer.new
        @cli_runner.get_player_move(@computer)
        @computer.received_move_request.should == true
      end
    
      it "should get a move from a second player" do
        @cli_runner.game.board_next_player = :player2
        @cli_runner.player2 = @human
        @cli_runner.next_player_move
        @ui.prompted_user.should == true      
      end
    
      it "should send a move and the player symbol to the game to make the move" do
        @cli_runner.game.board_next_player = :player1
        @ui.input = :some_space
        @human.symbol = :some_symbol
        @cli_runner.player1 = @human
        @cli_runner.next_player_move
        @game.received_move_space.should == :some_space
        @game.received_move_symbol.should == :some_symbol
      end    
    end
    
    describe "#game_over_scenario" do
      before(:each) do
        @ui.play_again = :no
      end
      
      it "should display the board one last time" do
        @game.board = :some_board
        @cli_runner.game_over_scenario
        @ui.displayed_board.should == :some_board
      end

      describe "#game_over_scenario draw" do
        it "should display the draw message if no game winner is present" do
          @cli_runner.game_over_scenario
          @ui.displayed_draw_message.should == true
        end
        
        it "should not display the draw message if a winner is present" do
          @game.board_winning_symbol = :winner
          @cli_runner.game_over_scenario
          @ui.displayed_draw_message.should be_nil
        end
      end
      
      describe "#game_over_scenario winner" do
        before(:each) do
          @game.board_winning_symbol = :winner
        end
        
        it "should tell the UI to display a winning message" do
          @cli_runner.game_over_scenario
          @ui.displayed_winning_message.should == true
        end
        
        it "should pass the winning symbol to the UI for the winning message" do        
          @cli_runner.game_over_scenario        
          @ui.message_contents.should include(:winner)
        end
      end
      
      describe "playing again" do        
        it "should tell the UI to ask the user to play again" do
          @cli_runner.game_over_scenario
          @ui.prompted_user.should == true
        end

        #@ui.input_values empties as the mock_ui prompts the user, then sets 
        #@ui.play_again = :no when completely empty        
        it "should reset the game if the player wants to play again" do
          @cli_runner.player1 = @human
          @cli_runner.player2 = @human
          @ui.play_again = :yes
          @game.over = true
          @ui.input_values = [:some_input]*2
          @cli_runner.game_over_scenario
          @game.game_reset.should == true
        end
        
        it "should restart the play loop if a user wants to play again" do
          @cli_runner.player1 = @human
          @cli_runner.player2 = @human
          @ui.play_again = :yes
          @game.over_values = [true]
          @ui.input_values = [:some_input]*2
          @cli_runner.game_over_scenario
          @ui.play_again.should == :no
        end
      end
    end    
  end
end

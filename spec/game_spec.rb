require 'game'
require 'mocks/mock_ui'
require 'mocks/mock_ai'
require 'mocks/mock_board'
require 'mocks/mock_player'
require 'mocks/mock_human'

describe "the tic tac toe game" do

  before(:each) do    
    ui = FakeUI.new
    @game = Game.new(ui)
    @ui = @game.ui
  end

  describe "the Game setup" do
    before(:each) do
      @ui.player_details = [{type: :human, symbol: "X"},
                            {type: :computer, symbol: "X"}]
    end

    it "should send a welcome message to the user" do
      @ui.play_again = :no      
      @game.play
      @ui.message_contents.should include(:welcome_message)
    end
    
    describe "setting up the competitors" do      
      it "should ask the ui to provide the type and symbol for a player" do
        @ui.play_again = :no
        @game.set_competitors
        @ui.requested_player_details.should == true
      end
      
      it "should create a player from the human class if type is human" # do
      #         @ui.input = {type: :human, symbol: "x"}
      #         @game.set_competitors
      #         @human.created_new_player.should == true
      #       end
      
      it "should create a new computer player if type is computer" # do
        #   @human = FakeHuman.new
        #   @ui.input = {type: :computer, symbol: "x"}
        #   @game.set_competitors
        #   @computer.created_new_player.should == true
        # end
            
      it "should set player2 for a game"
      
      it "should display the instructions for a user" do
        @board = FakeBoard.new
        @ui.play_again = :no
        @game.play
        @ui.displayed_instructions.should == true
      end
      
    end
    
  end
  
  describe "playing the game" do
    before(:each) do
      @player1 = FakeHuman.new
      @player2 = FakeHuman.new
      @game.player1 = @player1
      @game.player2 = @player2
      @board = FakeBoard.new
      @game.board = @board
      @player2.ui = @ui
      @ui = FakeUI.new
      @game.ui = @ui
      @player1.ui = @ui
      @ui.input_values = [:valid_move]
    end
    
    it "should call the play script until the game is over" do
      @ui.calling_play_script = true
      @game.play
      @game.exit_game.should == true
    end
    
    describe "the play script that repeats until the game is over " do        
      it "should tell the UI class to display the board" do
        @ui.play_again = :no
        @game.play_script
        @ui.displayed_board.should == @game.board
      end

      it "should know the game is over when the board returns a winner" do
        @board.game_won = true
        @game.game_is_over.should == true
      end 

      it "should know the game is over when the board returns a draw" do
        @board.is_draw = true
        @game.game_is_over.should == true
      end

      it "should know that the game is not over when there is no win or draw" do
        @board.is_draw = false
        @board.game_won = false
        @game.game_is_over.should_not == true
      end

      it "should send game over messages if a game is over" do
        @board.game_won = true
        @game.play_script
        @ui.message_contents.should include(:winner)
      end

      it "should not send a game over message if a game is not over" do
        @board.game_won = false
        @game.play_script
        @ui.message_contents.should_not include(:draw)
        @ui.message_contents.should_not include(:winner)      
      end

      it "should not prompt a user for the next move if the game is over" do
        @board.game_won = true
        @game.play_script
        @ui.prompted_user.should_not == :next_move_please
      end
    end
  end
  
    
  # describe "the method that gets the human move and checks that it's valid" do
  #   before(:each) do
  #     @ui = FakeUI.new
  #     @game.ui = @ui
  #     @board = FakeBoard.new
  #     @game.board = @board
  #     @ui.input_values = [:valid_move]
  #   end
  # 
  #   it "should prompt a user for the next move" do
  #     @game.get_human_move
  #     @ui.prompted_user.should == :next_move_please
  #   end
  #   
  #   it "should get some input from the ui" do      
  #     @game.get_human_move
  #     @ui.user_input.should include(:some_input)
  #   end
  #   
  #   it "should check with the board if it is a valid move" do
  #     @game.get_human_move
  #     @board.checked_validity.should == true
  #   end
  #       
  #   it "should not return an error message for a valid move" do
  #     @game.get_human_move
  #     @ui.message_contents.should_not include(:error_message)
  #   end
  #   
  #   it "should return an error message if a human move is invalid" do
  #     @ui.input_values = [:invalid_move, :valid_move]
  #     @game.get_human_move
  #     @ui.message_contents.should include(:error_message)
  #   end
  #   
  #   it "should continue to call itself if it receives invalid moves" do
  #     @ui.input_values = [:invalid_move]*3 + [:valid_move]
  #     @game.get_human_move
  #     @ui.message_contents.should == [:error_message]*3
  #   end
  # end

  describe "the game over scenario" do
    before(:each) do
      @ui = FakeUI.new
      @ui.input_values = []
      @board = FakeBoard.new
      @game.ui = @ui
      @game.board = @board
    end
    
    it "should send a winning message if there is a winner" do
      @board.game_won = true
      @game.game_over_scenario
      @ui.message_contents.should include(:winner)
    end
    
    it "should send a draw message if a game is a draw" do
      @board.is_draw = true
      @game.game_over_scenario
      @ui.message_contents.should include(:draw)
    end
        
    it "should ask a user if they want to play again" do
      @game.game_over_scenario
      @ui.prompted_user.should == true
    end
    
    describe "asking a user to play again" do
      it "should delegate to the UI to ask about playing again" do
        @game.ask_to_play_again
        @ui.prompted_user.should == true
      end
      
      it "should return game exit if the user doesn't want to play again" do
        @ui.play_again = :no
        @game.exit_game.should == true
      end
      
      it "should not set the exit attribute if the ui input does't" do
        @ui.play_again = nil
        @game.exit_game.should == false
      end
    end
  end
  
  describe "a game in which the Ai plays itself" do
    before(:each) do
      @game = Game.new
      @ui = FakeUI.new
      @game.ui = @ui  
      @board = FakeBoard.new
      @game.board = @board
      @ui.input_values = [:valid_move, :valid_move]
    end

  end
end

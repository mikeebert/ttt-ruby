require 'game'
require 'mocks'

describe "the tic tac toe game" do

  before(:each) do
    @game = Game.new
  end
  
  describe "the play method that runs a game" do
    before(:each) do
      @ui = FakeUI.new
      @game.ui = @ui
      @board = FakeBoard.new
      @game.board = @board
      @ai = FakeAi.new
      @game.ai = @ai
      @ui.input_values = [:valid_move]
    end
    
    it "should send a welcome message to the user" do
      @ui.play_again = :no
      @game.play
      @ui.message_contents.should include(:welcome_message)
    end

    #not testing the right thing
    it "should call the play script" do
      @ui.input_values = [:valid_move]*4 
      @game.play
      @ui.input_values.count.should == 0
    end
    
    it "should call the play script until the game is over" do
      @ui.input_values = [:valid_move]*4
      @game.play
      @game.exit_game.should == true
    end
  end
  
  describe "setting up the players of the game" do
    
    before(:each) do
      @ui = FakeUI.new
      @game.ui = @ui
    end

    it "should ask a user what type of game they would like to play" do
      @game.set_competitors
      @ui.prompted_user.should == true
    end
          
    it "should ask if a user wants to go first" do
      @ui.input = :humanVcomputer
      @game.set_competitors
      @ui.asked_to_play_first.should == true
    end

    it "should set the 1st player as a human & 2nd as computer if the human wants to go first" do
      @ui.input = :humanVcomputer
      @ui.play_first = :yes       
      @game.set_competitors
      @game.player1.should == :human
      @game.player2.should == :computer
    end
    
    it "should set the 1st player as a computer & 2nd as human if vice versa" do
      @ui.input = :humanVcomputer
      @game.set_competitors
      @game.player1.should == :computer
      @game.player2.should == :human
    end
    
    it "should set both players to the computer" do
      @ui.input = :computerVcomputer
      @game.set_competitors
      @game.player1.should == :computer
      @game.player2.should == :computer
    end
    
    it "should set both players to a human" do
      @ui.input = :humanVhuman
      @game.set_competitors
      @game.player1.should == :human
      @game.player2.should == :human
    end
  end
  
  describe "the play script that repeats until the game is over " do    
    before(:each) do
      @ui = FakeUI.new
      @ui.input_values = [:valid_move]
      @game.ui = @ui
      @board = FakeBoard.new
      @game.board = @board
      @ai = FakeAi.new
      @game.ai = @ai  
    end
    
    it "should tell the UI class to display the board" do
      @ui.play_again = :no
      @game.play_script
      @ui.displayed_board.should == @game.board
    end
    
    it "should get a move for a human player" do
      @ui.input = :humanVcomputer
      @ui.play_first = :yes
      @ui.play_again = :no
      @game.set_competitors
      @game.play_script
      @ui.user_input.should include(:some_input)
    end
    
    it "should get a move for a human player going second" do
      @ui.input = :humanVcomputer
      @ui.play_first = :no
      @ui.play_again = :no
      @game.set_competitors
      @game.play_script
      @ui.user_input.should include(:some_input)      
    end
    
    it "should delegate to the ai to make a move if it's their turn first" do
      @ui.input = :humanVcomputer
      @ui.play_first = :no
      @ui.play_again = :no
      @game.set_competitors
      @game.play_script
      @ai.received_board.should == true
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
        
    it "should delegate to the ai to make a computer move if the game isn't over" do
      @board.game_won = false
      @game.play_script
      @ai.received_board.should == true
    end
    
    it "should not delegate to the ai to make a computer move if the game IS over" do
      @ui.input = :humanVcomputer
      @ui.play_first = :yes
      @game.set_competitors
      @board.game_won = true
      @game.play_script
      @ai.received_board.should_not == true
    end
    
    it "should delegate to the " do
      
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
    
    describe "computer_move method" do
      it "should send the board to the Ai to make a move on the board" do
        @game.computer_move
        @ai.received_board.should == true
      end

      it "should send a message to the user after a computer move" do
        @game.computer_move
        @ui.message_contents.should include(:nice_move_message)
      end
    end
  end
    
  describe "the method that gets the human move and checks that it's valid" do
    before(:each) do
      @ui = FakeUI.new
      @game.ui = @ui
      @board = FakeBoard.new
      @game.board = @board
      @ui.input_values = [:valid_move]
    end

    it "should prompt a user for the next move" do
      @game.get_human_move
      @ui.prompted_user.should == :next_move_please
    end
    
    it "should get some input from the ui" do      
      @game.get_human_move
      @ui.user_input.should include(:some_input)
    end
    
    it "should check with the board if it is a valid move" do
      @game.get_human_move
      @board.checked_validity.should == true
    end
    
    it "should delegate to the board to make a human move" do
      @game.human_move(:move)
      @board.human_moves.should include(:move)      
    end
    
    it "should delegate to the board to make a human move if it is valid" do
      @game.get_human_move
      @board.human_moves.should include(:valid_move)
    end
    
    it "should not return an error message for a valid move" do
      @game.get_human_move
      @ui.message_contents.should_not include(:error_message)
    end
    
    it "should return an error message if a human move is invalid" do
      @ui.input_values = [:invalid_move, :valid_move]
      @game.get_human_move
      @ui.message_contents.should include(:error_message)
    end
    
    it "should continue to call itself if it receives invalid moves" do
      @ui.input_values = [:invalid_move]*3 + [:valid_move]
      @game.get_human_move
      @ui.message_contents.should == [:error_message]*3
    end
  end

  describe "send game over messages" do
    before(:each) do
      @ui = FakeUI.new
      @ui.input_values = []
      @board = FakeBoard.new
      @game.ui = @ui
      @game.board = @board
    end
    
    it "should send a winning message if there is a winner" do
      @board.game_won = true
      @game.game_over_message
      @ui.message_contents.should include(:winner)
    end
    
    it "should send a draw message if a game is a draw" do
      @board.is_draw = true
      @game.game_over_message
      @ui.message_contents.should include(:draw)
    end
    
    it "should not send a message if the game is not over" # do
     #      @game.game_over_message
     #      @ui.message_contents.should_not include(:draw)
     #      @ui.message_contents.should_not include(:winner)
     #    end
    
    it "should ask a user if they want to play again" do
      @game.game_over_message
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

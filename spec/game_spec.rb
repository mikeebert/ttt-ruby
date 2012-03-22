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
    end

    it "should tell the UI class to display the board" do
      @game.play
      @ui.displayed_board.should == @game.board
    end
    
    it "should send a welcome message to the user" do
      @game.play
      @ui.message_contents.should include(:welcome_message)
    end

    it "should complete the play_script until the game is over"
      # @game.play

  end
  
  
  describe "the play script that repeats until the game is over " do    

    before(:each) do
      @ui = FakeUI.new
      @game.ui = @ui
      @board = FakeBoard.new
      @game.board = @board
      @ui.input_values = [:valid_move]      
    end
    
    it "should get a human move" do
      @game.play_script
      @ui.user_input.should include(:some_input)
    end
    
    it "should know the game is over when the board returns a winner" do
      @board.has_winner = true
      @game.game_is_over.should == true
    end 
    
    it "should know the game is over when the board returns a draw" do
      @board.is_draw = true
      @game.game_is_over.should == true
    end
    
    it "should know that the game is not over when there is no win or draw" do
      @board.is_draw = false
      @board.has_winner = false
      @game.game_is_over.should_not == true
    end
        
    it "should delegate to the ai to make a computer move if the game isn't over"

    describe "computer_move method" do
      
      before(:each) do
        @ai = Ai.new
        @game.ai = @ai        
      end
      
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

  
end    
  
  
  # before(:each) do
  #   @game = Game.new(3)
  #   @game.board.human_symbol = "x"
  #   @game.board.computer_symbol = "o"
  # end
  # 
  # it "should have a board based on the initial size passed to it" do
  #   @game.board.grid.count.should == 3 
  # end
  # 
  # it "should allow a human to make a move on the board" do #
  #   @game.human_move(1)
  #   @game.human_move(9)
  #   @game.board.grid[0][0].should == "x"
  #   @game.board.grid[2][2].should == "x"
  # end
  # 
  # it "should make a computer move" do
  #   @game.computer_move
  #   @game.board.move_count.should == 1
  # end
  # 
  # it "should know when a game is over after a win" do
  #   @game.human_move(1)
  #   @game.human_move(2)
  #   @game.human_move(3)
  #   @game.game_is_over.should == true
  # end
  # 
  # it "should know when a game is over after a draw" do
  #   [1,3,5,8,9].each {|n| @game.human_move(n)}
  #   4.times {@game.computer_move}
  #   @game.game_is_over.should == true
  # end
  # 
  # it "should know when a game is not over" do
  #   @game.human_move(1)
  #   @game.game_is_over.should == false
  # end
  # 
  # it "should not allow a human to make a move in a space that is already taken"
  #   # @game.human_move(1)
  #   # @game.human_move(1).should == nil
  # 
  # it "should send a response after a computer move"
  #   # @game.computer_move_response.should == true 
  #   
  # it "should delegate to the UI to display the board" do
  #   @game.ui = FakeUI.new
  # end
# end
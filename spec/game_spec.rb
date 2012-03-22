require 'game'
require 'mocks'

describe "the tic tac toe game" do

  before(:each) do
    @game = Game.new(3)
  end
# are these tests doing too much?
  it "should create a new board with a size based on the argument passed" do
    @board = FakeBoard.new
    @game.board = @board
    @game.board.should be_an_instance_of FakeBoard
  end     
  
  it "should be aware of a user interface it can send information too" do
    @ui = FakeUI.new
    @game.ui = @ui
    @game.ui.should be_an_instance_of FakeUI 
  end

  it "should complete the play_script until the game is over"
    # @game.play
    
  describe "the game gets and makes a human move" do

    before(:each) do
      @ui = FakeUI.new
      @game.ui = @ui
      @board = FakeBoard.new
      @game.board = @board
    end

    it "should get some input from the ui" do
      @game.get_human_move
      @ui.user_input.should include(:some_input)
    end
    
    it "should check with the board if it is a valid move" do
      @game.get_human_move
      @ui.get_input
      @board.checked_validity.should == true
    end
    
    #this test feels slightly out of place because it's a separate method
    it "should delegate to the board to make a human move" do
      @game.human_move(:move)
      @board.human_moves.should include(:move)      
    end
    
    it "should delegate to the board to make a human move if it is valid" do
      
      @game.human_move(:move)
    end


  end


  describe "the game's interactions with the UI" do
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
      @ui.message_contents.should == ["some message"]
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
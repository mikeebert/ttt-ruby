require 'cli_play'
require 'mocks/mock_game'
require 'mocks/mock_ui'
require 'mocks/mock_player_factory'
require 'mocks/mock_board'


describe CliPlay do
  before(:each) do
    @ui = FakeUI.new
    @cli_runner = CliPlay.new(@ui)
    @game = FakeGame.new
    @cli_runner.game = @game
    @player_factory = MockPlayerFactory.new
    @cli_runner.player_factory = @player_factory
    @ui.player_details = [{type: :human, symbol: "X"},
                          {type: :computer, symbol: "O"}]
  end

  describe "setting up the game" do
    before(:each) do
      @ui.play_again == :no
    end

    it "should create a new Game" do
      @cli_runner.ui.should be_an_instance_of(FakeUI)
      @cli_runner.game.should be_an_instance_of(FakeGame)
    end


    it "should welcome the competitors" do
      @cli_runner.setup_game
      @ui.welcomed_competitors.should == true
    end

    it "should ask the ui to provide the type and symbol for a player" do
      @cli_runner.set_players
      @ui.requested_player_details.should == true
    end    

    it "should pass the player details from the ui to the player factory" do
      @ui.player_details = [{type: :human, symbol: "X"},
                            {type: :computer, symbol: "O"}]
      @cli_runner.set_players
      @player_factory.player1_type.should == :human
      @player_factory.player1_symbol.should == "X"
      @player_factory.player2_type.should == :computer
      @player_factory.player2_symbol.should == "O"
    end

    it "should send the player symbols to the game for the board" do
      @cli_runner.setup_game
      @game.board_player1_symbol.should == "X"
      @game.board_player2_symbol.should == "O"
    end
  end
    
  describe "Playing the Game" do
    it "should pass the Game's current board to the ui to display" do
      @game.board = :some_board
      @cli_runner.play_game
      @ui.displayed_board.should == :some_board
    end
    
    it "should " do
      
    end
  end
end

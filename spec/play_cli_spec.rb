require 'cli_play'
require 'human_player'
require 'mocks/mock_game'
require 'mocks/mock_ui'
require 'mocks/mock_player_factory'
require 'mocks/mock_board'


describe PlayCli do
  before(:each) do
    @ui = FakeUI.new
    @cli_runner = PlayCli.new(@ui)
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
      @game.over = true
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
    
  describe "Playing the Game" do
    it "should pass the Game's current board to the ui to display" do
      @game.over = true
      @game.board = :some_board
      @cli_runner.play_game
      @ui.displayed_board.should == :some_board
    end
    
  end
end

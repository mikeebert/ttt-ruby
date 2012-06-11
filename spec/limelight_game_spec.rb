require 'limelight_game'
require 'human_player'
require 'player_factory'
require 'mocks/mock_game'
require 'mocks/mock_ui'
require 'mocks/mock_board'
require 'mocks/mock_human'
require 'mocks/mock_computer'

module TTT
  describe LimelightGame do
  before(:each) do
    @ui = FakeUI.new
    @game = FakeGame.new
    @player_factory = TTT::PlayerFactory.new
    @player1 = {type: :human, symbol: "X"}
    @player2 = {type: :computer, symbol: "O"}
    @limelight_game = LimelightGame.new(@ui,@player1,@player2)
    @limelight_game.game = @game
    @limelight_game.player_factory = @player_factory
  end

    it "should set up the players" do
      @limelight_game.player1.class.should == TTT::HumanPlayer
      @limelight_game.player2.class.should == TTT::ComputerPlayer
    end
  end
end

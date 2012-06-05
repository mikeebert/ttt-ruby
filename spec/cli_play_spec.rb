require 'cli_play'
require 'mocks/mock_game'
require 'mocks/mock_ui'


describe CliPlay do
  before(:each) do
    @ui = FakeUI.new
  end
  
  it "should create a new Game" do
    @cli_runner = CliPlay.new(@ui)
    @cli_runner.game = FakeGame.new
    @cli_runner.game.should be_an_instance_of(FakeGame)
  end
  
  
end
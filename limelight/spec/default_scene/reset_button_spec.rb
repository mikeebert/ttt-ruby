require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'mock_limelight_game'

describe "Default Scene" do

  uses_limelight :scene => "limelight_ui", :hidden => true

  before(:each) do
    @game = MockLimelightGame.new
    production.game = @game
  end
  
  it "should tell the production.game to reset " do
    reset_button = scene.find("reset_btn")
    reset_button.mouse_clicked(nil)
    @game.game_reset.should == true
  end
  
end
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'mock_limelight_game'

describe "Default Scene" do

  uses_limelight :scene => "limelight_ui", :hidden => true

  before(:each) do
    production.game = MockLimelightGame.new
  end
  
  it "should change the production square when clicked" do
    square = scene.find("square1")
    square.mouse_clicked(nil)
    production.game.received_move.should == true
  end  
end

require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "limelight_ui", :hidden => true

  # it "should create a board" do
  #   scene.begin_game
  #   production.game.should_not be_nil
  # end
  
  it "should change the production square when clicked" do
    square = scene.find("square1")
    square.mouse_clicked(nil)
    production.human_move.should == 1
  end
  
  it "should clear the value of all squares " do
    square1 = scene.find("square1").text = "X"
    square2 = scene.find("square2").text = "X"
    square5 = scene.find("square5").text = "X"
    test_squares = [square1, square2, square5]

    reset_button = scene.find("reset_btn")
    reset_button.mouse_clicked(nil)

    test_squares.each do |square| 
      square.text.should == ""
    end
    
  end
  
  it "should reset the production board" do
    reset_button = scene.find("reset_btn")
    reset_button.mouse_clicked(nil)
    production.game.board.winning_symbol.should == nil
  end
end

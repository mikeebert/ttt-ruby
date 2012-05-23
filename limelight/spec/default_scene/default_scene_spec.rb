require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  before(:each) do
    start = scene.find("start_btn")
    start.mouse_clicked(nil)
  end

  it "should create a board" do
    production.board.should_not be_nil
  end
  
  it "should change the square when clicked" do
    square = scene.find("square1")
    square.mouse_clicked(nil)
    square.text.should_not == ""
  end
  
  it "should clear the value of all squares " do
    square1 = scene.find("square1")
    square2 = scene.find("square2")
    square5 = scene.find("square5")
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
    production.board.winner.should == nil
    production.board.grid.should_not
  end
end
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

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
    # 
    # test_squares.each do |square|
    #   square.mouse_clicked(nil)
    #   square.text.should_not == ""
    # end

    reset_button = scene.find("reset_btn")
    reset_button.mouse_clicked(nil)

    test_squares.each do |square| 
      square.text.should == ""
    end
    
  end
end
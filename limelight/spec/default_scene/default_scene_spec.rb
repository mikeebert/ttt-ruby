require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  it "should change the square when clicked" do
    square = scene.find("square1")
    square.mouse_clicked(nil)
    square.text.should_not == ""
  end
end
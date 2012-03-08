require "play.rb"

describe "playing the game" do

  it "should instantiate an instance of a new game" do
    @game = Game.new
    @game.should be_an_instance_of(Game)
  end
  
  

end
require 'play.rb'

describe "playing the game" do

  it "should instantiate an instance of a new game" do
    @game = Game.new
    @game.should be_an_instance_of(Game)
  end
  
  #not sure how to test for this one
  it "should display a board" 

  it "should get a player move" do
    move = 
    get_player_move.should 
  end
  
end
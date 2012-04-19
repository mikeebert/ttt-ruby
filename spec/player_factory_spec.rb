require 'player_factory'

describe PlayerFactory do
  it "should create a human player if the type is human" do
    input = {type: :human, symbol: "X"}
    player = PlayerFactory.create(input)
    player.should be_an_instance_of(HumanPlayer)
    player.symbol.should == "X"
  end
  
  it "should create a computer" do
    input = {type: :computer, symbol: "O"}
    player = PlayerFactory.create(input)
    player.should be_an_instance_of(ComputerPlayer)
    player.symbol.should == "O"
  end
end
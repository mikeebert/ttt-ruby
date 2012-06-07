require 'player_factory'

module TTT
  describe PlayerFactory do
    
    before(:each) do
      @player_factory = PlayerFactory.new
    end
    
    it "should create a human player if the type is human" do
      input = {:type => :human, :symbol => "X"}
      player = @player_factory.create(input)
      player.should be_an_instance_of(HumanPlayer)
      player.symbol.should == "X"
    end
  
    it "should create a computer" do
      input = {type: :computer, symbol: "O"}
      ui = :some_ui
      player = @player_factory.create(input)
      player.should be_an_instance_of(ComputerPlayer)
      player.symbol.should == "O"
    end
  end
end
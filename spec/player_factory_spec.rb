require 'player_factory'

module TTT
  describe PlayerFactory do  
    it "should create a human player if the type is human" do
      input = {type: :human, symbol: "X"}
      ui = :some_ui
      player = PlayerFactory.create(input, ui)
      player.should be_an_instance_of(HumanPlayer)
      player.symbol.should == "X"
      player.ui.should == :some_ui
    end
  
    it "should create a computer" do
      input = {type: :computer, symbol: "O"}
      ui = :some_ui
      player = PlayerFactory.create(input, ui)
      player.should be_an_instance_of(ComputerPlayer)
      player.symbol.should == "O"
    end
  end
end
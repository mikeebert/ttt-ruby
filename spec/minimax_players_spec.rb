require 'minimax_players'

module TTT
  describe "Minimax Players" do
    before(:each) do
      @min = MinPlayer.new("X", 50)
    end
  
    it "should set the symbol and starting score for a player" do
      @min.symbol.should == "X"
      @min.starting_score.should == 50
    end
  
    it "should return the lower score as the best score for a min player" do
      @min.compare(5,-5).should == -5
      @min.compare(-10,5).should == -10
    end
  
    it "should return the higher score as the best score for a max player" do
      @max = MaxPlayer.new("O",50)
      @max.compare(5,-5).should == 5
    end
  end
end
require 'player'
require 'mocks/mock_human'
require 'mocks/mock_board'


describe "The Player Class" do
  
  before(:each) do
    @player1 = FakeHuman.new
    # @player2 = FakeComputer.new
  end

  describe "getting a move" do
    
    it "should get a move from a human" do
      @player1
    end
  end

end


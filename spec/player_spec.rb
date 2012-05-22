require 'player'
require 'mocks/mock_human'
require 'mocks/mock_board'


describe Player do
  
  before(:each) do
    @player1 = Player.new = FakeHuman.new
    @player2 = FakeComputer.new
    @board = FakeBoard.new
  end

  describe "getting a move" do
    it "should get a move from a human"
    
    it "should get a move from a computer"
    
    it "should pass a player's symbol and move to the board"
    
  end
end


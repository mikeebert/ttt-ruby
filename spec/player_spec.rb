require 'player'
require 'mocks/mock_ui'
require 'mocks/mock_board'

describe "The Player Class" do
  
  before(:each) do
    @player1 = Player.new
    @player2 = Player.new
    @ui = FakeUI.new
    @player1.ui = @ui
    @player2.ui = @ui
  end
  
  describe "setting the type of player" do
    it "should get the type of player based on the response from the ui" do
      @ui.input_values = [:human,:computer]
      @player1.set_type_of_player(1)
      @player2.set_type_of_player(2)
      @player1.type.should == :human
      @player2.type.should == :computer
    end

    it "should set players to the same type" do
      @ui.input_values = [:computer,:computer]
      @player1.set_type_of_player(1)
      @player2.set_type_of_player(2)
      @player1.type.should == :computer
      @player2.type.should == :computer    
    end
  end

  describe "getting a move" do
    
    it "should get a move based on the type of player it is" do
      
    end
  end

end


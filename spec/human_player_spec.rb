require 'human_player'
require 'mocks/mock_ui'
require 'mocks/mock_board'


describe "The Human Player" do
  
  before(:each) do
    @human = HumanPlayer.new("x")
    @ui = FakeUI.new
    @human.ui = @ui
    @board = FakeBoard.new
  end
  
  it "should prompt the human for the next move" do
    @ui.input_values = [:valid_move]
    @human.get_move(@board)
    @ui.prompted_user.should == :next_move_please
  end
  
  it "should return a move that it gets from the UI if valid" do
    @ui.input_values = [:valid_move]
    @human.get_move(@board).should == :valid_move
  end

  it "should return a move that it gets from the UI if valid" do
    @ui.input_values = [:invalid_move,:valid_move]
    @human.get_move(@board)
    @ui.displayed_invalid_move_message.should == true
  end
end
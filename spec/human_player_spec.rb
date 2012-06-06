require 'player'
require 'human_player'
require 'mocks/mock_ui'
require 'mocks/mock_board'

module TTT
  describe HumanPlayer do  
    before(:each) do
      @ui = FakeUI.new
      @human = HumanPlayer.new("x")
      @human.ui = @ui
      @ui.input_values = [:move_prompt_stub, :valid_move]
      @board = FakeBoard.new
    end
  
    it "should respond to the move method from the Player superclass" do
      @human.move(@board)
      @ui.prompted_user.should == :next_move_please
    end
  
    it "should send the move and it's symbol to a board via the Player move method" do
      @human.move(@board)
      @board.received_symbol.should == ("x")
      @board.received_move.should == :valid_move
    end
  
    it "should prompt the human for the next move" do
      @human.get_move(@board)
      @ui.prompted_user.should == :next_move_please
    end
  
    it "should return a move that it gets from the UI if valid" do
      @human.get_move(@board).should == :valid_move
    end

    it "should request a move again from the UI if the move isn't valid" do
      @ui.input_values = [:move_prompt_stub, :invalid_move,:move_prompt_stub, :valid_move]
      @human.get_move(@board)
      @ui.prompted_counter.should == 2
    end
  end
end
require 'limelight_game'

module TTT
  describe LimelightGame do
    it "should have a board" do
      ui = :some_ui
      @game = LimelightGame.new(ui)
      @game.board.should_not be_nil
    end
  end
end
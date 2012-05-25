module TTT
  class LimelightGame
    attr_accessor :board,
                  :ui,
                  :observer,
                  :play_again
    def initialize(ui)
      @ui = ui
    end
    
    def update_board(symbol, space)
      @board.place_move(symbol, space)
      if @board.has_winner
        @ui.player_wins
        puts "got here too"
      end
    end
  end
end
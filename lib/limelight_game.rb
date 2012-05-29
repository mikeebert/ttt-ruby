require 'board'

module TTT
  class LimelightGame
    attr_accessor :board,
                  :ui,
                  :observer,
                  :play_again
    def initialize(ui)
      @ui = ui
      @board = Board.new(3)
    end
    
    def update_board(symbol, space)
      @board.place_move(symbol, space)
      if @board.has_winner
        @ui.player_wins
        puts "got here too"
      end
    end
    
    def reset
      @board.reset_board
    end
  end
end
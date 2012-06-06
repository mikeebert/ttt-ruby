require 'board'
require 'player_factory'
require 'commandlineinterface'

module TTT
  class Game
    attr_accessor :board, :ui, :player_factory, :player1, :player2

    def initialize
      @board = Board.new
    end
    
    def set_board_symbols(symbol1,symbol2)
      @board.player1_symbol = symbol1
      @board.player2_symbol = symbol2
    end
    
    def next_player
      @board.next_player
    end
    
    def game_over_scenario
      game_over_message
      @ui.display_board(@board.moves)
      @board.reset_board
      ask_to_play_again
      play_script unless exit_game
    end
    
    def current_board
      @board.moves
    end
    
    def is_over?
      @board.has_winner || @board.is_draw
    end

    def game_over_message
      if @board.has_winner
        @ui.winning_message(@board.winner) 
      else
        @ui.draw_message
      end
    end
  
    def ask_to_play_again
      @ui.prompt_to_play_again
    end
  end
end

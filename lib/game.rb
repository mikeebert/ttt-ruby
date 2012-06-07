require 'board'
require 'player_factory'
require 'commandlineinterface'

module TTT
  class Game
    attr_accessor :board, :next_player

    def initialize
      @board = Board.new
      @next_player = :player1
    end
    
    def set_board_symbols(symbol1,symbol2)
      @board.player1_symbol = symbol1
      @board.player2_symbol = symbol2
    end
    
    def next_player
      @board.next_player
    end
    
    def current_board
      @board.moves
    end
    
    def remaining_moves
      @board.available_spaces
    end
    
    def is_over?
      @board.has_winner || @board.is_draw
    end

    def winner
      return @board_winning_symbol if @board_winning_symbol != nil
    end
    
    def reset
      @board.reset
      @next_player = :player1
    end
  end
end

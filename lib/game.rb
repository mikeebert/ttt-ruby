require 'board'
require 'player_factory'
require 'commandlineinterface'

module TTT
  class Game
    attr_accessor :board, 
                  :next_player,
                  :player1_symbol, :player2_symbol

    def initialize
      @board = Board.new
      @next_player = :player1
    end
    
    def set_board_symbols(symbol1,symbol2)
      # @board.player1_symbol = symbol1
      # @board.player2_symbol = symbol2
      @player1_symbol = symbol1
      @player2_symbol = symbol2
    end
    
    def opponent
      @next_player == :player1 ? @player2_symbol : @player1_symbol
    end
    
    def current_board
      @board.moves
    end
    
    def remaining_moves
      @board.available_spaces
    end
    
    def make_move(symbol,move)
      @board.place_move(symbol,move)
      switch_next_player
    end
    
    def switch_next_player
      @next_player == :player1 ? @next_player = :player2 : @next_player = :player1
    end
    
    def is_over?
      @board.has_winner || @board.is_draw
    end

    def winner
      return @board.winning_symbol unless @board.winning_symbol.nil?
    end
    
    def reset
      @board.reset
      @next_player = :player1
    end
  end
end

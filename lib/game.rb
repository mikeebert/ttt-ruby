require 'board'
require 'player_factory'
require 'commandlineinterface'

module TTT
  class Game
    attr_accessor :board, :ui, :player_factory, :player1, :player2

    def initialize
      @board = Board.new
    end
      
    # def play
    #   @ui.welcome_message
    #   set_competitors
    #   @ui.display_instructions
    #   play_script unless exit_game 
    # end
  
    def play_script
      @ui.display_board(@board.moves)
      next_player_move
      if is_over?
        game_over_scenario 
      else
        play_script
      end
    end
    
    def set_board_symbols(symbol1,symbol2)
      @board.player1_symbol = symbol1
      @board.player2_symbol = symbol2
    end
  
    def next_player_move
      @board.next_player == :player1 ? @player1.move(@board) : @player2.move(@board)
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
  
    def exit_game
      @ui.play_again == :no
    end
  end
end

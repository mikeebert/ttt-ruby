require 'board'
require 'player_factory'

module TTT
  class LimelightGame
    attr_accessor :board, :ui, :player1, :player2

    def initialize(ui)
      @board = Board.new(3)
      @ui = ui
    end
        
    # def update_board(symbol, space)
    #   @board.place_move(symbol, space)
    #   if @board.has_winner
    #     @ui.player_wins
    #     puts "got here too"
    #   end
    # end
    
    def play
      set_competitors
      @board.set_players(@player1.symbol,@player2.symbol)
      play_script until game_is_over
    end
  
    def play_script
      @ui.display_board(@board)
      
      update_board
      next_player_move
      game_over_scenario if game_is_over
    end
  
    def next_player_move
      @board.next_player == :player1 ? @player1.move(@board) : @player2.move(@board)
    end
  
    def game_over_scenario
      if @board.has_winner
        @ui.winning_message(@board.winner) 
      else
        @ui.draw_message
      end
      @ui.display_board(@board)
      @board.reset_board
      play_script unless exit_game
    end
  
    def set_competitors
      set_player(1)
      set_player(2)
    end
  
    def set_player(n)
      input = @ui.get_details_for_player(n)
      player = PlayerFactory.create(input, @ui)
      n == 1 ? @player1 = player : @player2 = player
    end
    
    def game_is_over
      @board.has_winner || @board.is_draw
    end
  
    def ask_to_play_again
      @ui.prompt_to_play_again
    end
  
    def exit_game
      @ui.play_again == :no
    end
  end
end
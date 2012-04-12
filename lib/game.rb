require 'board'
require 'ai'
require 'commandlineinterface'
require 'player'

class Game
  
  attr_accessor :board, :ui, :ai, :type, :player1, :player2
  
  def initialize
    @board = Board.new(3)
    self.board = @board
    @ui = CommandLineInterface.new
    @ai = Ai.new
    @player1 = Player.new
    @player2 = Player.new
  end
  
  def play
    @ui.welcome_message
    set_competitors
    play_script until exit_game
  end

  def play_script
    @ui.display_board(@board)
    @player1.move(@board)
    @ui.display_board(@board)
    @player2.move(@board) unless game_is_over
    game_over_message if game_is_over
  end
  
  def set_competitors
    @player1.set_type_of_player(1)
    @player1.symbol = "x"
    @player2.set_type_of_player(2)
    @player2.symbol = "o"
  end
  
  def game_is_over
    @board.has_winner || @board.is_draw
  end
  
  def game_over_message
    if @board.has_winner
      @ui.winning_message
    else
      @ui.draw_message      
    end
    @ui.display_board(@board)
    @board.reset_grid
    ask_to_play_again
    play unless exit_game
  end
  
  def ask_to_play_again
    @ui.prompt_to_play_again
  end
  
  def exit_game
    @ui.play_again == :no
  end
end
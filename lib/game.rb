require 'board'
require 'commandlineinterface'
require 'player'
require 'player_factory'

class Game
  
  attr_accessor :board, :ui, :type, :player1, :player2
  
  def initialize(ui)
    @ui = ui
  end
  
  def play
    @ui.welcome_message
    set_competitors
    set_board
    @ui.display_instructions
    play_script until exit_game
  end
  
  def play_script
    @ui.display_board(@board)
    @player1.move(@board)
    @ui.display_board(@board)
    if game_is_over
      game_over_scenario
    else
      @player2.move(@board)
    end
  end
  
  def set_competitors
    set_player(1)
    set_player(2)
  end
  
  def set_player(n)
    input = @ui.get_details_for_player(n)
    player = PlayerFactory.create(input, @ui)
    if n == 1
      @player1 = player
    else
      @player2 = player
    end
  end
  
  def set_board
    # size = @ui.prompt_for_board_size
    @board = Board.new(3)
    @board.player1_symbol = @player1.symbol
    @board.player2_symbol = @player2.symbol
  end
  
  def game_is_over
    @board.has_winner || @board.is_draw
  end
  
  def game_over_scenario
    @ui.winning_message(@board.winner) if @board.has_winner
    @ui.draw_message if @board.is_draw
    @ui.display_board(@board)
    @board.reset_board
    ask_to_play_again
    play_script unless exit_game
  end
  
  def ask_to_play_again
    @ui.prompt_to_play_again
  end
  
  def exit_game
    @ui.play_again == :no
  end
end
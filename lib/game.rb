require 'board'
require 'commandlineinterface'
require 'player'
require 'player_factory'

class Game
  
  attr_accessor :board, :ui, :type, :player1, :player2
  
  def initialize
    @board = Board.new(3)
    self.board = @board
    @ui = CommandLineInterface.new
  end
  
  def play
    @ui.welcome_message
    set_competitors
    @ui.display_instructions
    play_script until exit_game
  end

  def set_competitors
    input = @ui.get_details_for_player(1)
    @player1 = PlayerFactory.create(input, @ui)
    @board.player1_symbol = input[:symbol]
    input2 = @ui.get_details_for_player(2)
    @player2 = PlayerFactory.create(input2, @ui)
    @board.player2_symbol = input2[:symbol]
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
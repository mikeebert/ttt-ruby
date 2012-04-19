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
    play_script until exit_game
  end

  def set_competitors
    @ui.get_details_for_player(1)
    @player1 = PlayerFactory.create(@ui.input, @ui)
    @board.player1_symbol = @ui.input[:symbol]
    @ui.get_details_for_player(2)
    @player2 = PlayerFactory.create(@ui.input, @ui)
    @board.player1_symbol = @ui.input[:symbol]
  end
  
  def play_script
    @ui.display_board(@board)
    @player1.move(@board)
    @ui.display_board(@board)
    @player2.move(@board) unless game_is_over
    game_over_scenario if game_is_over
  end
  
  def game_is_over
    @board.has_winner || @board.is_draw
  end
  
  def game_over_scenario
    if @board.has_winner
      @ui.winning_message(@board.winner)
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

private
  # def set_details_for_player1
  #   if @ui.input[:type] == :human 
  #     @player1 = HumanPlayer.new(@ui.input[:symbol])
  #   else
  #     @player1 = ComputerPlayer.new(@ui.input[:symbol])
  #   end
  #   @board.player1_symbol = @ui.input[:symbol]
  # end
  # 
  # def set_details_for_player2
  #   if @ui.input[:type] == :human 
  #     @player2 = HumanPlayer.new(@ui.input[:symbol])
  #   else
  #     @player2 = ComputerPlayer.new(@ui.input[:symbol])
  #   end
  #   @board.player2_symbol = @ui.input[:symbol]
  # end
end
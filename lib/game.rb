require 'board'
require 'ai'
require 'commandlineinterface'

class Game
  
  attr_accessor :board, :ui, :ai, :exit_game
  
  def play
    @ui.display_board(@board)
    @ui.welcome_message
    play_script until @exit_game
  end

  def play_script 
    get_human_move
    computer_move unless game_is_over
    @ui.display_board(@board)
    game_over_message if game_is_over
    @ui.prompt_for_next_move unless game_is_over
  end
  
  def get_human_move
    input = @ui.get_input
    if @board.valid_move(input)
      human_move(input) 
    else      
      @ui.invalid_move_message
      get_human_move
    end
  end
  
  def game_is_over
    @board.has_winner || @board.is_draw
  end
  
  def human_move(n)
    @board.place_human_move(n)
  end
  
  def computer_move
    @ai.move(@board)
    @ui.computer_move_message
  end
  
  def game_over_message
    if @board.has_winner
      @ui.winning_message
    elsif @board.is_draw
      @ui.draw_message      
    end
    ask_to_play_again
  end
  
  def ask_to_play_again #doing too much?
    @ui.prompt_to_play_again
    if @ui.input == :no
      @exit_game = true
    else
      self.board.reset_grid
      @ui.display_board(@board)      
    end
  end
end
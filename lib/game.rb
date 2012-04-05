require 'board'
require 'ai'
require 'commandlineinterface'

class Game
  
  attr_accessor :board, :ui, :ai, :type, :player1, :player2
  
  def initialize
    @board = Board.new(3)
    @ui = CommandLineInterface.new
    @ai = Ai.new
  end
  
  def play
    @ui.welcome_message
    set_competitors
    play_script until exit_game
  end

  def play_script
    @ui.display_board(@board)
    get_move(@player1)
    @ui.display_board(@board)    
    get_move(@player2) unless game_is_over
    game_over_message && @board.reset_grid if game_is_over
  end
  
  def set_competitors
    @ui.ask_for_type_of_game
    if @ui.input == :humanVcomputer
      @ui.ask_to_play_first
      set_first_player
    elsif @ui.input == :computerVcomputer
      @player1 = :computer; @player2 = :computer
    elsif @ui.input == :humanVhuman
      @player1 = :human; @player2 = :human
    end
  end
  
  def set_first_player
    if @ui.play_first == :yes
      @player1 = :human; @player2 = :computer
    else
      @player1 = :computer; @player2 = :human      
    end
  end
  
  def get_move(n)
    if n == :human 
      get_human_move
    else 
      computer_move
    end
  end
  
  def get_human_move
    @ui.prompt_for_next_move
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
    else
      @ui.draw_message      
    end
    ask_to_play_again
  end
  
  def ask_to_play_again
    @ui.prompt_to_play_again
  end
  
  def exit_game
    @ui.play_again == :no
  end
end
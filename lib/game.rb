require 'board'
require 'ai'
require 'commandlineinterface'

class Game
  
  attr_accessor :board, :ui, :ai, :type, :player1, :player2
  
  def initialize
    @board = Board.new(3)
    self.board = @board
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
    player_move(@player1)
    @ui.display_board(@board)
    if game_is_over
      game_over_message
      @board.reset_grid
    else
      player_move(@player2)      
    end
  end
  
  def set_competitors
    @ui.ask_for_type_of_game
    if @ui.input == :humanVcomputer
      @ui.ask_to_play_first
      set_first_player      
    elsif @ui.input == :computerVcomputer
      @player1 = :computer; @player2 = :computer2
    elsif @ui.input == :humanVhuman
      @player1 = :human; @player2 = :human
    end
    @board.next_player = :player1
    # puts "First player symbol is #{@board.player1_symbol}"
    # puts "Second player symbol is #{@board.player2_symbol}"
  end
  
  def set_first_player
    if @ui.play_first == :yes
      @player1 = :human; @player2 = :computer
    else
      @player1 = :computer; @player2 = :human      
    end
  end
  
  def player_move(n)
    move = get_move(n)
    n == @player1 ? @board.place_player1_move(move) : @board.place_player2_move(move)
    @ui.computer_move_message if n == :computer || n == :computer2
  end
  
  def get_move(n)
    n == :human ? get_human_move : get_computer_move
  end
  
  def get_human_move
    @ui.prompt_for_next_move
    input = @ui.get_input
    if @board.valid_move(input)
      return input 
    else      
      @ui.invalid_move_message
      get_human_move
    end
  end
  
  def game_is_over
    @board.has_winner || @board.is_draw
  end
  
  def get_computer_move
    move = @ai.move(@board)
    return move
  end
  
  def game_over_message
    if @board.has_winner
      @ui.winning_message
    else
      @ui.draw_message      
    end
    @ui.display_board(@board)
    ask_to_play_again
    set_competitors unless exit_game
  end
  
  def ask_to_play_again
    @ui.prompt_to_play_again
  end
  
  def exit_game
    @ui.play_again == :no
  end
end
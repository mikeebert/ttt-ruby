require 'board'
require 'ai'
require 'commandline'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
    @ui = CommandLineInterface.new
  end
  
  def play #still too much?
    @ui.display_board(@board)
    @ui.welcome_message     
    play_script until game_is_over    
  end

  def play_script #still too much?
    get_human_move
    computer_move unless game_is_over
    @ui.display_board(@board)
    check_for_winner
  end
  
  def get_human_move #still too much?
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
    self.board.place_human_move(n)
  end
  
  def computer_move
    Ai.move(@board)
    @ui.computer_move_message
  end
  
  def check_for_winner
    if @board.has_winner
      @ui.winning_message
    elsif @board.is_draw
      @ui.draw_message
    else
      @ui.prompt_for_next_move
    end
  end
  
end
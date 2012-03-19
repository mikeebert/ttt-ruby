require 'board'
require 'ai'
require 'commandline'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
    @ui = CommandLineInterface.new
  end
  
  def play
    @ui.display_board(@board)
    @ui.welcome_message 
    
    while self.game_is_over == false
      input = @ui.get_input
      if @board.valid_move(input) 
        self.human_move(input)
        if self.game_is_over == false 
          self.computer_move 
        end
      else
        @ui.invalid_move_message 
      end 
      @ui.display_board(@board)
      self.check_for_winner
    end  
    
  end
  
  def game_is_over
    @board.has_winner == true || @board.is_draw == true
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
require 'board'
require 'ai'
require 'commandline'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
  end
  
  def play
    CommandLine.display_board(@board)
    CommandLine.welcome_message 
    while self.is_over == false
      input = gets.chomp.to_i
      if @board.valid_move(input) 
        self.human_move(input)
        if self.is_over == false 
          self.computer_move 
        end
      else
        CommandLine.invalid_move_message 
      end 
      CommandLine.display_board(@board)
      self.check_for_winner
    end  
  end
  
  def is_over
    @board.has_winner == true || @board.is_draw == true
  end
  
  def human_move(n)
    self.board.place_human_move(n)
  end
  
  def computer_move
    Ai.move(@board)
    CommandLine.computer_move_message
  end
  
  def check_for_winner
    if @board.has_winner
      CommandLine.winning_message
    elsif @board.is_draw
      CommandLine.draw_message
    else
      CommandLine.prompt_for_next_move
    end
  end
  
end
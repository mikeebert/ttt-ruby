require 'board'
require 'ai'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
    @grid = @board.grid
  end
        
  def human_move(n)
    self.board.place_human_move(n)
  end
  
  def computer_move
    Ai.move(@board)
  end
  
  def winner?
    @board.has_winning_move?
  end
  
  def draw?
    @board.is_full_with_no_winner
  end
  
  def display_board
    @grid.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end
  
end
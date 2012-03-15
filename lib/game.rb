require 'board'
require 'ai'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
    @grid = @board.grid
  end
  
  def play
    self.display_board

    while @board.has_winner != true

      input = gets.chomp.to_i

      if @board.valid_move(input)
        self.human_move(input)
        if @board.has_winner != true && @board.is_draw == false
          self.computer_move
          puts "Nice Move, check out mine (the o's)."
        end
      else
        puts "Not a valid move. Please try again"
      end

      self.display_board

      if @board.has_winner == true
        puts "Winner. Game Over"
      elsif @board.is_draw
        self.display_board
        puts "Tie Game."
        break
      else 
        puts "Enter your next move:"
      end
    end
  end
  
  def human_move(n)
    self.board.place_human_move(n)
  end
  
  def computer_move
    Ai.move(@board)
  end
  
  def display_board
    @grid.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end
  
end
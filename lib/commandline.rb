require 'game'

class CommandLine
  
  def self.display_board(board)
    board.grid.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end

  def self.welcome_message
    puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board to make your first move."
  end
  
  def self.invalid_move_message
    puts "Not a valid move. Please try again"
  end
  
  def self.computer_move_message
    puts "Nice Move, check out mine (the o's)."
  end
  
  def self.winning_message
    puts "Winner. Game Over"
  end
  
  def self.draw_message
    puts "Tie Game."
  end
  
  def self.prompt_for_next_move
    puts "Enter your next move:"
  end
  
end
class CommandLineInterface
  
  attr_accessor :input

  def get_input 
    self.input = gets.chomp.to_i
  end
  
  def display_board(board)
    board.grid.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end

  def welcome_message
    puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board to make your first move."
  end
  
  def invalid_move_message
    puts "Not a valid move. Please enter another move:"
  end
  
  def computer_move_message
    puts "Nice Move, check out mine (the o's)."
  end
  
  def winning_message
    puts "Winner. Game Over."
  end
  
  def draw_message
    puts "Tie Game. Game Over."
  end
  
  def prompt_for_next_move
    puts "Enter your next move:"
  end
  
end
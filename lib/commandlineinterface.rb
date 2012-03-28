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
  
  def prompt_to_play_again
    puts "Would you like to play again? (Y/N)"
    self.input = gets.chomp.downcase

    if input == "n"
      @input = :no
    elsif input == "y"
      @input = :yes
    else    
      puts "Sorry, I couldn't understand that. Enter a single Y or N for Yes or No."
      prompt_to_play_again
    end
  end
end
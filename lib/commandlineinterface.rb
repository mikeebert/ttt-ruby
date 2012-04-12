class CommandLineInterface
  
  attr_accessor :input
  attr_accessor :play_again
  attr_accessor :play_first

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
    puts "Welcome to Tic Tac Toe. Below is the tic-tac-toe baord.\nEnter a number corresponding to a position on the board to make your first move."
  end
  
  def ask_for_type_of_player(n)
    puts "Should Player #{n} be a human or computer?\n1. Human \n2.Computer\n(Please enter 1 or 2)"
    input = gets.chomp

    if input == "1"
      input = :human
    elsif input == "2"
      input = :computer
    else
      puts "Not a valid entry."
      ask_for_type_of_player(n)
    end
    return input    
  end
  
  def invalid_move_message
    puts "Not a valid move. Please enter another move:"
  end
  
  def computer_move_message
    puts "Check out my move."
  end
  
  def winning_message(winner)
    puts "#{winner} wins. Game Over."
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
      @play_again = :no
    elsif input == "y"
      @play_again = :yes
    else    
      puts "Sorry, I couldn't understand that. Enter a single Y or N for Yes or No."
      prompt_to_play_again
    end
  end
end
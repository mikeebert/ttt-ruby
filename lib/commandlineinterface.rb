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
    puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board to make your first move."
  end
  
  def ask_for_type_of_game
    puts "What type of game would you like to play?\n1. Human vs Computer?\n2. Computer vs Computer?\n3. Human vs Human\nPlease enter 1, 2 or 3:"
    input = gets.chomp
    
    if input == "1"
      @input = :humanVcomputer
    elsif input == "2"
      @input = :computerVcomputer
    elsif input == "3"
      @input = :humanVhuman
    else
      puts "Not a valid entry."
      ask_for_type_of_game
    end    
  end
  
  def ask_to_play_first
    puts "Would you like to play first? (Y/N)"
    input = gets.chomp.downcase    
    if input == "y"
      @play_first = :yes
    elsif input == "n"
      @play_first = :no
    else
      puts "Not a valid entry. Please enter Y or N"
      ask_to_play_first
    end      
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
      @play_again = :no
    elsif input == "y"
      @play_again = :yes
    else    
      puts "Sorry, I couldn't understand that. Enter a single Y or N for Yes or No."
      prompt_to_play_again
    end
  end
end
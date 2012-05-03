class CommandLineInterface
  
  attr_accessor :input
  attr_accessor :first_player_symbol
  attr_accessor :play_again
  attr_accessor :play_first

  def welcome_message
    puts "Welcome to Tic Tac Toe."
  end
    
    
  # def display_board(board)
  #   board.grid.each do |line| 
  #     line.each {|value| print "#{value} "}
  #     print "\n"
  #   end
  #   print "-------\n"
  # end
    
  def display_board(board)
    board.grid.each do |line| 
      line.each do |value|
        if value.class != Fixnum
          print "#{value}|"
        else
          print "_|"
        end
      end
      print " "
      line.each do |value|
        if value.class == Fixnum
          print "#{value} "
        else
          print "  "
        end
      end
      print "\n"
    end
    print "==============\n"
  end

  def get_details_for_player(n)
    @input = Hash.new
    @input[:type] = prompt_for_type(n)
    @input[:symbol] = prompt_for_symbol(n)
    return @input
  end
  
  def prompt_for_type(n)
    puts "Should Player #{n} be a human or computer?\n1. Human \n2.Computer\n(Please enter 1 or 2)"
    input = gets.chomp
    if input == "1"
      return :human
    elsif input == "2"
      return :computer
    else
      puts "Not a valid entry."
      prompt_for_type(n)
    end
  end
  
  def prompt_for_symbol(n)
    puts "What alphanumeric symbol would you like to represent Player #{n}?"
    input = gets.slice(0)
    if input != "\n" && input != @first_player_symbol
      puts "OK. Player #{n}'s symbol will be #{input}."
      @first_player_symbol ||= input
      return input
    else
      puts "Not a valid Symbol"
      prompt_for_symbol(n)
    end
  end
  
  def prompt_for_board_size
    puts "You can play any size board. The traditional size for tic-tac-toe is 3 x 3.\nWhat would size board would you like to play? (Enter the size of one side, i.e. 3)"
    input = gets.slice(0).to_i
    if input.class != Fixnum
      puts "Not a valid number. Please enter another: "
      prompt_for_board_size
    end
    input
  end
  
  def display_instructions
    puts "Below is the tic-tac-toe board.\nNumbers on the right correspond to Spaces on the left."
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
  
  def get_input 
    self.input = gets.chomp.to_i
  end
  
end
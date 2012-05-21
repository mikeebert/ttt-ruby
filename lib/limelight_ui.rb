class LimelightUI

  attr_accessor :input
  attr_accessor :play_again

  def welcome_message
  end
  
  def display_board(board)
  end

  def get_details_for_player(n)
  end

  def prompt_for_type(n)
  end

  def prompt_for_symbol(n)
  end

  def prompt_for_board_size
  end

  def display_instructions
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
    @input = gets.chomp.downcase

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
    @input = gets.chomp.to_i
  end
  
end
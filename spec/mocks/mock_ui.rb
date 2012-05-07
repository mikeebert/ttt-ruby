class FakeUI
  attr_accessor :displayed_board,
                :displayed_instructions,
                :message_contents,
                :user_input,
                :input_values,
                :prompted_user,
                :input,
                :play_again,
                :asked_for_input,
                :asked_to_play_first,
                :play_first,
                :player_details,
                :requested_player_details,
                :prompted_counter,
                :calling_play_script
  
  def initialize
    @message_contents = []
    @user_input = []
    @prompted_counter = 0
  end
  
  def display_board(board)
    @displayed_board = board
    if @calling_play_script == true
      @input_values = [:valid_move]*10 
    end
  end
  
  def welcome_message
    @message_contents << :welcome_message
  end
  
  def display_instructions
    @displayed_instructions = true
  end
  
  def get_input
    @user_input << :some_input
    if @input_values.empty?
      @play_again = :no
    else
      @input_values.shift
    end
  end
  
  def invalid_move_message
    @message_contents << :error_message
  end
  
  def computer_move_message
    @message_contents << :nice_move_message
  end
  
  def winning_message(winner)
    @message_contents << :winner
  end
  
  def draw_message
    @message_contents << :draw
  end
  
  def prompt_for_next_move
    @prompted_user = :next_move_please
    @prompted_counter += 1
    @input_values.shift
  end
  
  def prompt_to_play_again
    @prompted_user = true
    @input = @input_values.shift
    @play_again = :no if @input_values.empty?
  end
  
  def ask_for_type_of_game
    @prompted_user = true
    @input = @input_values.shift
  end
  
  def get_details_for_player(n)
    @requested_player_details = true
    @player_details.shift    
  end
  
end
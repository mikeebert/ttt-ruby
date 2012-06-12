class FakeUI
  attr_accessor :asked_for_input,
                :asked_to_play_first,
                :calling_play_script,
                :displayed_board,
                :displayed_instructions,
                :displayed_in_progress,
                :displayed_draw_message,
                :displayed_winning_message,
                :input,
                :input_values,
                :message_contents,
                :prompted_counter,
                :prompted_user,                
                :play_again,
                :play_first,
                :player_details,
                :requested_player_details,
                :user_input,
                :welcomed_competitors
  
  def initialize
    @message_contents = []
    @user_input = []
    @prompted_counter = 0
  end
    
  def display_board(board)
    @displayed_board = board
  end
  
  def welcome_message
    @welcomed_competitors = true
  end
  
  def display_instructions
    @displayed_instructions = true
  end
  
  def display_game_in_progress
    @displayed_in_progress = true
  end
  
  def get_input
    @user_input << :some_input
    @play_again = :no if @input_values.empty?  
    @input_values.shift
  end
  
  def get_human_move(spaces)
    @prompted_user = true
    @input
  end
  
  def invalid_move_message
    @message_contents << :error_message
  end
  
  def computer_move_message
    @message_contents << :nice_move_message
  end
  
  def winning_message(winner)
    @displayed_winning_message = true
    @message_contents << :winner
  end
  
  def draw_message
    @displayed_draw_message = true
  end
  
  def prompt_for_next_move
    @prompted_user = :next_move_please
    @prompted_counter += 1
    @input_values.shift
  end
  
  def prompt_to_play_again
    @prompted_user = true
    if @input_values != nil
      @input = @input_values.shift
      @play_again = :no if @input_values.empty?
    end
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
class FakeUI
  attr_accessor :displayed_board
  attr_accessor :message_contents
  attr_accessor :user_input
  attr_accessor :input_values
  attr_accessor :prompted_user
  attr_accessor :input
  attr_accessor :play_again
  attr_accessor :asked_for_input
  attr_accessor :asked_to_play_first
  attr_accessor :play_first
  attr_accessor :requested_player_details
  attr_accessor :prompted_counter
  
  def initialize
    @message_contents = []
    @user_input = []
    @prompted_counter = 0
  end
  
  def display_board(board)
    @displayed_board = board
  end
  
  def welcome_message
    @message_contents << :welcome_message
  end
  
  def get_input
    @user_input << :some_input
    @input_values.shift
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
  end
  
  def prompt_to_play_again
    @prompted_user = true
    @input = @input_values.shift
    @play_again = :no if @input_values.empty?
  end
  
  def ask_for_type_of_game
    @prompted_user = true
  end
  
  def get_details_for_player(n)
    @requested_player_details = true
  end
  
end
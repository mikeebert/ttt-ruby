class FakeUI
  attr_accessor :displayed_board
  attr_accessor :message_contents
  attr_accessor :user_input
  attr_accessor :input_values
  attr_accessor :prompted_user
  
  def initialize
    @message_contents = []
    @user_input = []
  end
  
  def display_board(board)
    @displayed_board = board
    # board.has_winner = true if @play_cycles == 4
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
  
  def winning_message
    @message_contents << :winner
  end
  
  def draw_message
    @message_contents << :draw
  end
  
  def prompt_for_next_move
    @prompted_user = true
  end
end

class FakeBoard
  attr_accessor :human_moves  
  attr_accessor :checked_validity
  attr_accessor :is_draw
  attr_accessor :game_won
  attr_accessor :made_computer_move
  attr_accessor :provided_spaces
  attr_accessor :spaces_values
  attr_accessor :loop_counter
  
  def initialize
     @human_moves = []
     @checked_for_winner = []
     @spaces_values = [[:valid_move], [1]]
     @loop_counter = 0
   end
  
  def place_human_move(n)
    @human_moves << n
  end
  
  def valid_move(n)
    @checked_validity = true
    n == :valid_move
  end
  
  def available_spaces
    @provided_spaces = true
    @spaces_values.shift
  end
  
  def place_computer_move(n)
    @made_computer_move = true
  end
  
  def has_winner
    @loop_counter += 1
    @game_won ||= true if @loop_counter >= 5
    @game_won == true
  end
end

class FakeAi

  attr_accessor :received_board
  
  def move(board)
    @received_board = true
  end

end
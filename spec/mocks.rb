class FakeUI
  attr_accessor :displayed_board
  attr_accessor :message_contents
  attr_accessor :user_input
  attr_accessor :input_values
  
  def initialize
    @message_contents = []
    @user_input = []
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
end

class FakeBoard
  attr_accessor :human_moves  
  attr_accessor :checked_validity
  attr_accessor :has_winner
  attr_accessor :is_draw
  
  def initialize
     @human_moves = []
   end
  
  def place_human_move(n)
    @human_moves << n
  end
  
  def valid_move(n)
    @checked_validity = true
    n == :valid_move
  end
end

class Ai

  attr_accessor :received_board
  
  def move(board)
    @received_board = true
  end

end
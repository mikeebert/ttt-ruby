class FakeUI
  
  attr_accessor :displayed_board
  attr_accessor :message_contents
  attr_accessor :user_input
  
  def initialize
    @message_contents = []
    @user_input = []
  end
  
  def display_board(board)
    @displayed_board = board
  end
  
  def welcome_message
    @message_contents << "some message"
  end
  
  def get_input
    @user_input << :some_input
  end
  
end

class FakeBoard
  
  attr_accessor :human_moves  
  attr_accessor :checked_validity
  
  def initialize
     @human_moves = []
   end
  
  def place_human_move(n)
    @human_moves << n
  end
  
  def valid_move(n)
    # if n == :valid
      @checked_validity = true
    # else
    #   @checked_validity = false
    # end
  end
  
end
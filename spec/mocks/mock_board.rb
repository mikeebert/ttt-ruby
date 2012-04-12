class FakeBoard
  attr_accessor :human_moves  
  attr_accessor :checked_validity
  attr_accessor :is_draw
  attr_accessor :game_won
  attr_accessor :made_computer_move
  attr_accessor :provided_spaces
  attr_accessor :spaces_values
  attr_accessor :loop_counter
  attr_accessor :reset_the_grid
  attr_accessor :next_player
  
  def initialize
     @human_moves = []
     @checked_for_winner = []
     @spaces_values = [[:valid_move], [1]]
     @loop_counter = 0
   end
  
  def place_player1_move(n)
    @human_moves << n
  end
  
  def valid_move(n)
    @checked_validity = true
    n == :valid_move
  end
  
  def available_spaces
    @provided_spaces = true
    @spaces_values
  end
  
  def place_player2_move(n)
    @made_computer_move = true
  end
  
  def has_winner
    @loop_counter += 1
    @game_won ||= true if @loop_counter >= 5
    @game_won == true
  end
  
  def reset_grid
    @reset_the_grid = true
  end
  
  def move_count
  end
  
end

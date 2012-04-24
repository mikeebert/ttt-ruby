class FakeBoard
  attr_accessor :size,
                :grid,
                :human_moves,
                :checked_validity,
                :is_draw,
                :game_won,
                :made_computer_move,
                :provided_spaces,
                :spaces_values,
                :loop_counter,
                :reset_the_grid,
                :next_player,
                :winner,
                :received_symbol,
                :received_move,
                :checked_spaces_for_computer,
                :player1_symbol,
                :player2_symbol
  
  def initialize
     @size = 9
     @grid = [[1,2,3],[4,5,6],[7,8,9]]
     @human_moves = []
     @checked_for_winner = []
     @spaces_values = [[:valid_move], [1]]
     @loop_counter = 0
     @winner = []
   end
  
  def place_player1_move(n)
    @human_moves << n
  end
  
  def valid_move(n)
    @checked_validity = true
    n == :valid_move
  end
  
  def place_move(symbol,move)
    @received_symbol = symbol
    @received_move = move
  end
  
  def available_spaces
    @checked_spaces_for_computer = true
    @provided_spaces = true
    @spaces_values
  end
  
  def next_player_symbol
    @next_player == :player1 ? @player1symbol : @player2symbol
  end
    
  def has_winner
    @loop_counter += 1
    @game_won ||= true if @loop_counter >= 5
    @game_won == true
  end
  
  
  def reset_board
    @reset_the_grid = true
    @reset_next_player = true
    @reset_the_winner = true
  end
  
  def move_count
  end
  
end

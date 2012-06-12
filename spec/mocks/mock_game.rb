class FakeGame
  
  attr_accessor :board,
                :board_next_player,
                :board_player1_symbol,
                :board_player2_symbol,
                :board_winning_symbol,
                :checked_status,
                :created_board,
                :game_reset,
                :moves_made,
                :next_player,
                :over,
                :over_values,
                :player1_symbol,
                :player2_symbol,
                :provided_next_player,
                :received_move_space,
                :received_move_symbol
  
  def create_board(size)
    @created_board = true
  end
  
  def set_game_player_symbols(symbol1,symbol2)
    @board_player1_symbol = symbol1
    @board_player2_symbol = symbol2
  end
  
  def current_board
    @over = @over_values.shift unless @over_values.nil?
    return @board    
  end
  
  def next_player_symbol
  end
  
  def opponent_symbol    
  end
  
  def remaining_moves
    @board    
  end
  
  def make_move(symbol,move)
    @moves_made += 1 unless @moves_made.nil?
    @received_move_symbol = symbol
    @received_move_space = move
  end
  
  def is_over?
    @checked_status = true
    return @over
  end
  
  def winner
    return @board_winning_symbol if @board_winning_symbol != nil
  end
  
  def reset
    @game_reset = true
  end
end
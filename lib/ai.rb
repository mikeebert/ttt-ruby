require 'minimax_players'

class Ai
  attr_accessor :max_symbol, 
                :min_symbol,
                :possible_moves
      
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board)
    set_min_and_max_players(board)
    @possible_moves = []
    best_score_for_max = -50
    
    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(@max_symbol, space)
      new_score = minimax_score(test_board)
      if new_score > best_score_for_max
        best_score_for_max = new_score
        @possible_moves = [] #reset the @possible_moves if ranked higher than others
        @possible_moves << space
      elsif new_score == best_score_for_max
        @possible_moves << space
      end
    end
    
    return @possible_moves.sample
  end
    
  def minimax_score(board)
    score = game_value(board)
    return score unless score == -1
    player_symbol = board.next_player_symbol
    best_score = starting_score_for(player_symbol)

    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(player_symbol, space)
      new_score = minimax_score(test_board)      
      best_score = compare(best_score, new_score, player_symbol)
    end
    
    return best_score
  end
    
  def starting_score_for(player_symbol)
    if player_symbol == @min_symbol
      return 50
    else
      return -50
    end
  end
  
  def compare(best_score, new_score, player_symbol)
    if player_symbol == @min_symbol
      new_score < best_score ? new_score : best_score
    else
      new_score > best_score ? new_score : best_score
    end
  end
    
  def game_value(board)
    if board.has_winner || board.is_draw
      return 100 if board.winner == @max_symbol
      return -100 if board.winner == @min_symbol
      return 0 if board.is_draw
    else
      return -1
    end
  end
  
  def set_min_and_max_players(board)
    @max_symbol = board.next_player_symbol
    @min_symbol = board.opponent_symbol
  end
    
  def copy(board)
    new_board = Board.new(Math.sqrt(board.size).to_i)
    row_index = 0
    new_board.grid.each do |row|
      row.replace(board.grid[row_index])
      row_index += 1
    end
    new_board.next_player = board.next_player
    new_board.player1_symbol = board.player1_symbol
    new_board.player2_symbol = board.player2_symbol
    return new_board
  end
  
end

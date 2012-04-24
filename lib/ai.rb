require 'board'

class Ai
  attr_accessor :max_player,
                :min_player,
                :max_symbol, 
                :min_symbol,
                :possible_moves
      
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board)
    set_min_and_max_players(board)
    @possible_moves = []
    new_score = -100
    best_score_for_max = -5    
    
    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(@max_symbol, space)
      new_score = minimax_score(test_board)
      if new_score > best_score_for_max
        best_score_for_max = new_score
        @possible_moves = [] #reset the @possible_moves if higher than others
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

    if board.next_player == @min_player
      scoring_for_player = @min_player
      new_score = 100
      best_score = 5
    else
      scoring_for_player = @max_player
      new_score = -100
      best_score = -5    
    end

    board.available_spaces.each do |space|
      test_board = copy(board)

      # test_board.place_move(board.next_player_symbol, space)

      if test_board.next_player == @min_player
        test_board.place_move(@min_symbol, space)
      else
        test_board.place_move(@max_symbol, space)
      end

      new_score = minimax_score(test_board)

      best_score = compare_min(best_score,new_score) if scoring_for_player == @min_player
      best_score = compare_max(best_score,new_score) if scoring_for_player == @max_player

    end
    return best_score
  end
  
  def compare_min(best_score,new_score)
    new_score < best_score ? new_score : best_score
  end
  
  def compare_max(best_score,new_score)
    new_score > best_score ? new_score : best_score
  end
  
  # def set_scoring_for(board)
  #   if board.next_player == @min_player
  #     @scoring_for_player = @min_player
  #     @new_score = 100
  #     @best_score = 5
  #   else
  #     @scoring_for_player = @max_player
  #     @new_score = -100
  #     @best_score = -5    
  #   end    
  #   return {new_score: @new_score, best_score: @best_score, scoring: @scoring_for_player}
  # end
    
  def game_value(board)
    if board.has_winner || board.is_draw
      if board.winner == @max_symbol
        return 100
      elsif board.winner == @min_symbol
        return -100
      elsif board.is_draw
        return 0
      end
    else
      return -1
    end
  end
  
  def set_min_and_max_players(board)
    if board.next_player == :player1
      @max_symbol = board.player1_symbol
      @max_player = :player1
      @min_symbol = board.player2_symbol
      @min_player = :player2
    elsif board.next_player == :player2
      @max_symbol = board.player2_symbol
      @max_player = :player2
      @min_symbol = board.player1_symbol
      @min_player = :player1
    end
  end  
  
  def copy(board)
    new_board = Board.new(Math.sqrt(board.size).to_i)
    row_index = 0
    new_board.grid.each do |row|
      row.replace(board.grid[row_index])
      row_index += 1
    end
    new_board.next_player = board.next_player
    return new_board
  end
  
end

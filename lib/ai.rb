require 'board'

class Ai
  attr_accessor :original_move_count,
                :max_player,
                :min_player,
                :max_symbol, 
                :min_symbol,
                :possible_moves
  
  def initialize
  end
    
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board)
    set_min_and_max_players(board)
    @original_move_count = board.move_count
    @possible_moves = []
    new_score = -100
    best_score_for_max = -5    
    
    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(@max_symbol, space)
      new_score = minimax_score(test_board)
      if new_score >= best_score_for_max
        puts "it got here"
        best_score_for_max = new_score
        @possible_moves << space
      end
    end
    print "#{@possible_moves} \n"
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
      if test_board.next_player == @min_player
        test_board.place_move(@min_symbol, space)
      else
        test_board.place_move(@max_symbol, space)
      end
      
      new_score = minimax_score(test_board)
      # puts "minimax_score new score is: #{new_score}"

      if scoring_for_player == @min_player
        best_score = new_score if new_score < best_score
      elsif scoring_for_player == @max_player
        best_score = new_score if new_score > best_score
      end
    end
    return best_score
  end
  
  def game_value(board)
    # moves = board.move_count - @original_move_count
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
  
  # def get_minimax_move(board)
  #   set_min_and_max_symbols(board)
  #   @original_move_count = board.move_count
  #   @outcomes = {}
  #   board.available_spaces.each do |move|
  #     depth = board.size
  #     initial_score = 0
  #     @outcomes[move] = [depth, initial_score]
  #     make_max_move(board, move)
  #   end
  #   puts @outcomes
  #   return best_move
  # end
  # 
  # def make_max_move(board,move)
  #   board.available_spaces.each do |space|
  #     new_board = copy(board)
  #     new_board.place_move(@max_symbol, space)
  #     # if new_board.has_winner || new_board.is_draw
  #     rank_move(new_board, move, space)
  #     # else
  #     make_min_move(new_board, move) unless new_board.has_winner || new_board.is_draw
  #     # end
  #   end
  # end
  # 
  # def make_min_move(board, move)
  #   board.available_spaces.each do |space|
  #     new_board = copy(board)
  #     new_board.place_move(@min_symbol, space)
  #     # if new_board.has_winner || new_board.is_draw
  #     rank_move(new_board, move, space)
  #     # else
  #     make_max_move(new_board, move) unless new_board.has_winner || new_board.is_draw
  #     # end
  #   end
  # end
  # 
  # def best_move
  #   if @outcomes.values.include?([1,100])
  #     return @outcomes.key([1,100]) 
  #   # elsif @outcomes.values.include?([2,-50])
  #   #   return @outcomes.key([2,-50])
  #   else
  #     move = @outcomes.max_by{|move, depth_and_rank| depth_and_rank[1]}
  #     return move[0]
  #   end
  # end
  # 
  # def rank_move(board, move, space)
  #   move_count = board.move_count - @original_move_count
  #   current_move_count = @outcomes[move][0]
  #   current_move_rank = @outcomes[move][1].abs
  #   if board.has_winner || board.is_draw
  #     if board.winner == @max_symbol
  #       puts "Yes the max_symbol won"
  #       rank = 100/move_count
  #       puts "Space #{move} Winner is Max in #{move_count} moves and a rank of #{rank}"
  #     
  #       if move_count <= current_move_count && rank > current_move_rank
  #         if move == 9
  #           puts "Move is: #{move}. Move count is #{move_count}. Rank is #{rank}"
  #         end
  #         @outcomes[move][0] = move_count
  #         @outcomes[move][1] = rank
  #       end
  #     
  #     elsif board.winner == @min_symbol
  #       puts "Space #{move} Winner is Min in #{move_count} moves and a rank of #{rank}"      
  #       rank = -(100/move_count)
  #       if move_count <= current_move_count && rank.abs > current_move_rank
  #         if move == 9
  #           puts "Move is: #{move}. Move count is #{move_count}. Rank is #{rank}"
  #         end
  # 
  #         @outcomes[move][0] = move_count
  #         @outcomes[move][1] = rank
  #       end
  #     
  #     elsif board.is_draw
  #       if move_count <= current_move_count && 0 > current_move_rank
  #         @outcomes[move][0] = move_count
  #         @outcomes[move][1] = 0
  #       end
  #     end
  #   else 
  #     rank = 0
  #     if move_count <= current_move_count && rank > current_move_rank
  #       @outcomes[move][0] = move_count
  #       @outcomes[move][1]
  #     end
  #   end
  # end
  
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

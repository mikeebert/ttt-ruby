require 'minimax_players'

class Ai
  attr_accessor :max,
                :min,
                :possible_moves
  def initialize
    @possible_moves = []
    # @move_scores = {}
  end

  def random_move(board)
    position = board.available_spaces.sample
  end

  def get_minimax_move(board)
    set_min_and_max_players(board)
    best_score_for_max = @max.starting_score
    alpha = -100
    beta = 100
    depth = 0
    # @max_depth = 6

    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(@max.symbol, space)
      # @move_scores[space] = alpha
      new_score = minimax_score(test_board, space, alpha, beta, depth+1)
      if new_score > best_score_for_max
        best_score_for_max = new_score
        # @move_scores[space] = new_score if new_score > @move_scores[space]
        @possible_moves = []
        @possible_moves << space
      elsif new_score == best_score_for_max
        @possible_moves << space
      end
    end
    # puts @move_scores    
    return best_move 
  end

  def minimax_score(board, space, alpha, beta, depth)
    score = game_value(board, depth)
    return score unless score == -1
    player = set_player(board.next_player_symbol)
    best_score = player.starting_score

    board.available_spaces.each do |space|
      test_board = copy(board)
      test_board.place_move(player.symbol, space)
      new_score = minimax_score(test_board, space, alpha, beta, depth + 1)
      best_score = player.compare(best_score, new_score)      
      is_max?(player) ? alpha = best_score : beta = best_score
      break if alpha >= beta
    end

    return best_score
  end
  
  def best_move
    if @possible_moves.any? {|n| n.odd?}
      @possible_moves.select{|n| n.odd?}.sample
    else
      @possible_moves.sample
    end
  end

  def set_player(symbol)
    symbol == @max.symbol ? @max : @min
  end
  
  def is_max?(player)
    player.symbol == @max.symbol
  end

  def game_value(board, depth)
    if board.has_winner || board.is_draw
      return (100 - depth) if board.winner == @max.symbol
      return -(100 - depth) if board.winner == @min.symbol
      return 0 if board.is_draw
    # elsif depth > @max_depth
    #   if board.next_player_symbol == @max.symbol
    #     return -depth
    #   else
    #     return depth
    #   end
    else
     return -1
    end
  end
    
  def set_min_and_max_players(board)
    @max = MaxPlayer.new(board.next_player_symbol, -5)
    @min = MinPlayer.new(board.opponent_symbol, 5)
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

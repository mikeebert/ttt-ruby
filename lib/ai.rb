require 'minimax_players'

module TTT
  class Ai
    attr_accessor :max,
                  :min,
                  :possible_moves
    def initialize
      @possible_moves = []
    end

    def random_move(board)
      spaces = board.available_spaces
      position = spaces[rand(spaces.size)]
    end

    def get_minimax_move(board,max_symbol,min_symbol)
      set_min_and_max_players(max_symbol, min_symbol)
      best_score_for_max = @max.starting_score
      alpha = -100
      beta = 100
      depth = 0
      
      board.available_spaces.each do |space|
        test_board = copy(board)
        test_board.place_move(@max.symbol, space)
        new_score = minimax_score(test_board, opponent_of(@max), alpha, beta, depth + 1)
        if new_score > best_score_for_max
          best_score_for_max = new_score
          @possible_moves = []
          @possible_moves << space
        elsif new_score == best_score_for_max
          @possible_moves << space
        end
      end
      return chosen_move
    end

    def minimax_score(board, player, alpha, beta, depth)
      score = game_value(board, depth)
      return score unless score == -1
      best_score = player.starting_score
    
      board.available_spaces.each do |space|
        test_board = copy(board)
        test_board.place_move(player.symbol, space)
        new_score = minimax_score(test_board, opponent_of(player), alpha, beta, depth + 1)
        best_score = player.compare(best_score, new_score)      
        is_max?(player) ? alpha = best_score : beta = best_score
        break if alpha >= beta
      end
    
      return best_score
    end
    
    def opponent_of(player)
      player == @max ? @min : @max
    end
  
    def chosen_move
      if @possible_moves.any? {|n| n.odd?}
        moves = @possible_moves.select{|n| n.odd?}
        moves[rand(moves.size)]
      else
        @possible_moves[rand(@possible_moves.size)]
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
        return (100 - depth) if board.winning_symbol == @max.symbol
        return -(100 - depth) if board.winning_symbol == @min.symbol
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
    
    def set_min_and_max_players(max_symbol,min_symbol)
      @max = MaxPlayer.new(max_symbol, -5)
      @min = MinPlayer.new(min_symbol, 5)
    end
    
    def copy(board)
      new_board = Board.new(Math.sqrt(board.size).to_i)
      row_index = 0
      new_board.grid.each do |row|
        row.replace(board.grid[row_index])
        row_index += 1
      end
      return new_board
    end
  end
end
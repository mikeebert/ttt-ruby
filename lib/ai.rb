require 'board'

class Ai
  attr_accessor :test_board
  attr_accessor :possible_outcomes
  attr_accessor :current_player
  attr_accessor :test_board
  attr_accessor :original_move_count
  
  def initialize
    @possible_outcomes = Hash.new
  end
  
  def move(board)
    # return random_move(board)
    @original_move_count = board.move_count
    rank_available_moves(board)
    board.place_player2_move(best_move(@possible_outcomes))
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    return position 
  end
  
  def rank_available_moves(board)
    board.available_spaces.each do |move| 
      @possible_outcomes[move] = {:max => 0, :min => 0}
      @test_board = create_test_board(board)
      @test_board.place_mock_move(move)
      play_all_possible_games(@test_board, move)
    end  
  end
  
  def play_all_possible_games(board, move)
    if board.has_winner || board.is_draw
      final_value = final_value(board)
      rank_minimax(final_value, move)
    else
      board.available_spaces.each do |next_move|
        new_board = create_test_board(board)
        new_board.place_mock_move(next_move)
        play_all_possible_games(new_board, move)
      end
    end
  end
  
  # def rank_all_games(board, move)
  #   
  # end
  # 
  # def play_all_possible_games(board,move)
  #   if board.has_winner || board.is_draw
  #     final_value = final_value(board)
  #     rank_minimax(final_value, move)
  #   elsif board.next_player == @ai_player
  #     make_max_move(board,move)
  #   else
  #     make_min_move(board, move)
  #   end
  # end
  
  def make_max_move(board, move)
    
    play_all_possible_games(board,move)
  end
  
  def make_min_move(board, move)
  end

  def create_test_board(board)
    test_board = Board.new(Math.sqrt(board.size).to_i)
    test_board.player2_symbol = board.player2_symbol
    test_board.player1_symbol = board.player1_symbol
    test_board.next_player = board.next_player
    row_number = 0
    test_board.grid.each do |row|
      row.replace(board.grid[row_number])
      row_number += 1
    end
    return test_board
  end
  
  def final_value(board)
    depth = board.move_count - @original_move_count
    if board.winner == [board.player2_symbol]
      return 100/depth
    elsif board.is_draw
      return 1
    else
      return -(100/(depth-1))
    end
  end

  def rank_minimax(value, move)
    if value > 1
      # @possible_outcomes[move][:max] << value
      if value > @possible_outcomes[move][:max]
        @possible_outcomes[move][:max] = value
      elsif value == @possible_outcomes[move][:max]
        @possible_outcomes[move][:max] += value
      end
    elsif value < 0
      # @possible_outcomes[move][:max] << value
      if value < @possible_outcomes[move][:min]
        @possible_outcomes[move][:min] = value 
      elsif value == @possible_outcomes[move][:min]
        @possible_outcomes[move][:min] += value
      end
    end
  end
  
  def best_move(possible_outcomes)
      max_rank = possible_outcomes.max_by {|move,data| data[:max]}[1][:max]
      min_rank = possible_outcomes.min_by {|move,data| data[:min]}[1][:min]
      if max_rank >= -(min_rank)
        return possible_outcomes.max_by {|move,data| data[:max]}.first
      else
        return possible_outcomes.max_by {|move,data| data[:min]}.first
      end
  end

  def display_outcomes
    @possible_outcomes.each {|outcome| print "#{outcome} \n"}
  end
end

class BoardState
  
end

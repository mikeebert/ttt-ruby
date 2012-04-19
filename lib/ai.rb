require 'board'

class Ai
  attr_accessor :original_move_count,
                :possible_moves, 
                :max_symbol, 
                :min_symbol, 
                :max_move, 
                :min_move
  
  def initialize
  end
    
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board)
    set_min_and_max_symbols(board)
    @original_move_count = board.move_count
    @max_move = {0 => -1}; @min_move = {0 => 1}
    board.available_spaces.each do |move|
      make_max_move(board, move)
    end
    return best_move
  end
  
  # def move_is_win(board,move,symbol)
  #   test_board = copy(board)
  #   test_board.place_move(symbol,move)     
  #   if test_board.has_winner
  #     return true 
  #   end
  # end
  
  def best_move
    if @max_move.values[0] == 100
      return @max_move.keys[0]
    elsif @min_move.values[0] == -50
      return @min_move.keys[0]
    else
      return @max_move.keys[0]
    end
  end
  
  def make_max_move(board,move)
    board.available_spaces.each do |space|
      new_board = copy(board)
      new_board.place_move(@max_symbol, space)
      if new_board.has_winner || new_board.is_draw
        rank_move(new_board, move, space)
      else
        make_min_move(new_board, move)
      end
    end
  end
  
  def make_min_move(board, move)
    board.available_spaces.each do |space|
      new_board = copy(board)
      new_board.place_move(@min_symbol, space)
      if new_board.has_winner || new_board.is_draw
        rank_move(new_board, move, space)
      else
        make_max_move(new_board, move)
      end
    end
  end
  
  def rank_move(board, move, space)
    move_count = board.move_count - @original_move_count
    if board.winner == @max_symbol
      rank = 100/move_count
      @max_move = {move => rank} if rank > @max_move.values[0]
    elsif board.winner = @min_symbol
      rank = -(100/move_count)
      @min_move = {space => rank} if rank < @min_move.values[0]
    elsif board.is_draw
      @max_move = {move => 0} if 0 > @max_move.values[0]
    end
  end
  
  def set_min_and_max_symbols(board)
    if board.next_player == :player1
      @max_symbol = board.player1_symbol 
    else
      @max_symbol = board.player2_symbol
    end
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
    return new_board
  end
  
end

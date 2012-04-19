require 'board'

class Ai
  attr_accessor :possible_moves, 
                :max_symbol, 
                :min_symbol, 
                :max_move, 
                :min_move
  
  def initialize
  end
    
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board, symbol)
    @max_symbol = symbol
    @min_symbol = board.opponent_symbol
    @possible_moves = Hash.new
    board.available_spaces.each do |move|
       if move_is_win(board, move, symbol)
         @possible_moves[move] = 100
         @max_move = move
    #      break
    #    else
    #      rank_minimax(board,move)
       end
     end
  end
  
  def move_is_win(board,move,symbol)
    test_board = copy(board)
    test_board.place_move(symbol,move) 
    return true if test_board.has_winner
  end
    
  def play_out_scenarios(board,move)
    board = board.dup
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

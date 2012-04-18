require 'board'

class Ai
  attr_accessor :possible_moves
  
  def initialize
  end
    
  def random_move(board)
    position = board.available_spaces.sample
  end
  
  def get_minimax_move(board)
    @possible_moves = Hash.new
    board.available_spaces.each do |move|
      if move_is_win(board,move)
        @possible_moves[move] = 100
        break
      else
        play_out_scenarios(board,move)
      end
    end    
  end
  
  def move_is_win(baord,move)
    board.coordinates_of(move)
    # return true if row, column or diagonal has two similar spaces
  end
  
  def play_out_scenarios(board,move)
    board = board.dup
  end
  
end

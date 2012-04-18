require 'board'

class Ai
  
  def initialize
  
  end
  
  def move(board)
    return random_move(board)
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    return position 
  end
  
end

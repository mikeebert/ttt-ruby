require 'board'

class Ai
  
  def move(board) # only exists for the initial purposes of testing
    random_move(board)  
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    board.place_computer_move(position)  
  end
end

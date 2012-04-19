require 'board'

class Player  
  
  attr_accessor :symbol
  
  def move(board)
    move = self.get_move(board)
    board.place_move(@symbol, move)    
  end
end

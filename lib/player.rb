require 'commandlineinterface'
require 'board'
require 'ai'

class Player
  def initialize
    @ui = CommandLineInterface.new
  end
  
  def set_symbol_for_player(n)
    @symbol = n[:symbol]    
  end
  
  def move(board)
    move = get_move(board)
    board.place_move(@symbol, move)    
  end
end

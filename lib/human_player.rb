require 'commandlineinterface'

class HumanPlayer < Player
  attr_accessor :ui
  
  def initialize(symbol)
    @ui = CommandLineInterface.new
    @symbol = symbol
  end
  
  def get_move(board)
    @ui.prompt_for_next_move
    move = @ui.get_input
    if board.valid_move(move)
      return move
    else      
      @ui.invalid_move_message
      get_move(board)
    end
  end  
end
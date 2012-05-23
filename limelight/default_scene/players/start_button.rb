$: << File.expand_path(File.dirname(__FILE__) + "/../../../lib")
# print $: << File.expand_path(File.dirname(__FILE__) + "../../../..")
require 'board'

module StartButton
  def mouse_clicked(event)
    production.board = TTT::Board.new(3)
    production.board.player1_symbol = "X"
    production.board.player2_symbol = "O"    
  end
end




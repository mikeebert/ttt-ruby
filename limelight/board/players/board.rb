require 'board'
require 'limelight_game'

module Board
  
  def begin_game
    production.game = TTT::LimelightGame.new(self)
    # production.game.board = TTT::Board.new(3)
    production.game.board.player1_symbol = "X"
    production.game.board.player2_symbol = "O"    
  end
  
  def player_wins
    scene.find("square1").text = "W"
    
   # build do
   #   cover :border_color => "green" do
   #     cover_header :text => "Player wins!"
   #   end
   # end     
  end
  
end
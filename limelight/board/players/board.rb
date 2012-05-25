require 'board'
require 'limelight_game'

module Board
  
  def begin_game
    production.game = TTT::LimelightGame.new(self)
    scene.find('display_text').text = " "
    scene.find('display_text').text = "Game in Progress"
  end
  
  def player_wins
    scene.find("display_text").text = "#{production.game.board.winner} Wins!"
   # build do
   #   cover :border_color => "green" do
   #     cover_header :text => "Player wins!"
   #   end
   # end     
  end
  
end
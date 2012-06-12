require 'limelight_game'

module StartButton
  
  def mouse_clicked(event)
    setup_production_game
  end

  def setup_production_game
    production.game = LimelightGame.new(scene)
    load_players
    production.game.create_players(@player1, @player2)
    production.game.begin_game    
  end
    
  def load_players
    @player1 = {:type => scene.find('first_player').value.downcase.to_sym, 
               :symbol => "X"}
    @player2 = {:type => scene.find('second_player').value.downcase.to_sym, 
               :symbol => "O" }
  end  
end

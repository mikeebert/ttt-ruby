require 'limelight_game'

module StartButton
  
  def mouse_clicked(event)
    load_players
    scene.start_game(@player1,@player2)    
  end
    
  def load_players
    @player1 = {:type => scene.find('first_player').value.downcase.to_sym, 
               :symbol => "X"}
    @player2 = {:type => scene.find('second_player').value.downcase.to_sym, 
               :symbol => "O" }
  end  
end

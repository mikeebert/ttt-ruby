require 'game'

module StartGame
  
  def mouse_clicked(event)
    reset_human_move
    load_players
    begin_game
  end
  
  def reset_human_move
    production.human_move = nil
  end
  
  def load_players    
    player1,player2 = Hash.new,Hash.new
    player1[:type] = scene.find('first_player').value.downcase.to_sym
    player1[:symbol] = "X"
    player2[:type] = scene.find('second_player').value.downcase.to_sym
    player2[:symbol] = "O"
    production.player_values = [player1,player2]
  end
  
  def begin_game
    production.game = TTT::Game.new(scene)
    Thread.new do
      production.game.play
    end
  end
  
end

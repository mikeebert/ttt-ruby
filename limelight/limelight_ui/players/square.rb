module Square
  
  def mouse_clicked(event)    
    if self.text.empty?
      move = self.id.match(/\d/)[0]
      pass_to_adapter(move.to_i)
    end
  end
    
  def pass_to_adapter(move)
    production.game.update_game(move)
  end

end
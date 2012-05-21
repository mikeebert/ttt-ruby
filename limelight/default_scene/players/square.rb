module Square
  
  def mouse_clicked(event)    
    if available?      
      production.player == 1 ? player1_move : player2_move
      production.player = other(production.player)
    end
  end
  
  def available?
    self.text.empty?
  end
  
  def player1_move
    self.text = "X"
  end
  
  def player2_move
    self.text = "O"
  end
  
  def other(player)
    production.player == 1 ? production.player = 2 : production.player = 1
  end
end
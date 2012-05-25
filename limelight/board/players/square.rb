module Square
  
  def mouse_clicked(event)    
    if available?
      n = self.id.match(/\d/)[0]
      symbol = production.game.board.next_player_symbol
      production.game.update_board(symbol,n.to_i)
      self.text = symbol
    end
  end
  
  def available?
    self.text.empty?
  end
  

end
module Square
  
  def mouse_clicked(event)    
    if available?
      n = self.id.match(/\d/)[0]
      symbol = production.board.next_player_symbol
      production.board.place_move(symbol, n.to_i)
      self.text = symbol
    end
  end
  
  def available?
    self.text.empty?
  end

end
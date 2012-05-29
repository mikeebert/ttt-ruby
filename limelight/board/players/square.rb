module Square
  
  def mouse_clicked(event)    
    if available?
      n = self.id.match(/\d/)[0]
      production.human_move = n.to_i
    end
  end
  
  def available?
    self.text.empty?
  end
  

end
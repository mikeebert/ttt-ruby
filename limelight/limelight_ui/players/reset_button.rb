module ResetButton
  
  def mouse_clicked(event)
    scene.update_display("Press Start to Begin Game")
    clear_board    
    production.play_again = :yes
  end

  def clear_board
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end
  end
  
end

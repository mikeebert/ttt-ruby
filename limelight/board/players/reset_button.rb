module ResetButton
  
  def mouse_clicked(event)
    clear_board
    production.human_move = nil
    production.play_again = :yes
  end

  def clear_board
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end
    scene.find("display_text").text = ""
  end
  
end

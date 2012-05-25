module ResetButton
  
  def mouse_clicked(event)
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end
    scene.find("display_text").text = "Game in progress"
    production.game.reset
  end
end

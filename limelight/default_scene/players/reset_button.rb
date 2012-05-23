module ResetButton
  
  def mouse_clicked(event)
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end

    production.board.reset_board
  end
end

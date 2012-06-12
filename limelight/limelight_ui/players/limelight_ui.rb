module LimelightUi

  def display_board(moves)
    index = 0
    (1..9).to_a.each do |n|
      space = moves.flatten[index]
      scene.find("square#{n}").text = space unless space.empty?
      index += 1
    end
  end
  
  def clear_board
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end
  end

  def update_display(string)
    scene.find("display").text = ""
    scene.find("display").text = string
  end
  
  def winning_message(winner)
    update_display("Game Over. #{winner} Wins!")
  end
  
  def draw_message
    update_display("Game Over. Tie Game.")
  end
    
  def display_game_in_progress
    update_display("Game in Progress")
  end
  
  def prompt_for_new_game
    update_display("Press Start to Begin Game")
  end
end

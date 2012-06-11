module LimelightUi

  def start_game(player1,player2)
    production.game = LimelightGame.new(self, player1, player2)
    production.game.begin
  end

  def make_move(n)
    production.game.update_game(n)
  end

  def get_details_for_player(n)
    production.player_values.shift
  end

  def display_board(moves)
    index = 0
    (1..9).to_a.each do |n|
      space = moves.flatten[index]
      scene.find("square#{n}").text = space unless space.empty?
      index += 1
    end
  end

  def winning_message(winner)
    update_display("Game Over. #{winner} Wins!")
  end
  
  def draw_message
    update_display("Game Over. Tie Game.")
  end
  
  def update_display(string)
    scene.find("display").text = " "
    scene.find("display").text = string
  end
  
  def display_game_in_progress
    update_display("Game in Progress")
  end
  
  def reset
    clear_board 
    production.game.reset_game
    update_display("Press Start to Begin Game")
  end

  def clear_board
    (1..9).each do |n|
      scene.find("square#{n}").text = ""
    end
  end
    
  
end

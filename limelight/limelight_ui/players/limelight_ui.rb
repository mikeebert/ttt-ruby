# require 'game'

module LimelightUi
  
  def get_details_for_player(n)
    production.player_values.shift   
  end
  
  def welcome_message
    display_game_in_progress
  end
  
  def display_instructions
    update_display("Game Starting...")
  end
  
  def display_board(board)
    index = 0
    (1..9).to_a.each do |n|
      space = board.grid.flatten[index]
      if space == "X" || space == "O"
        scene.find("square#{n}").text = space 
      end
      index += 1
    end
  end
  
  def prompt_for_next_move
    update_display("Game in Progress")
  end
  
  def get_input    
    return production.human_move
  end
  
  def invalid_move_message
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
  
  def prompt_to_play_again
    production.play_again = :no
  end  
  
  def play_again
    return production.play_again
  end
  
end
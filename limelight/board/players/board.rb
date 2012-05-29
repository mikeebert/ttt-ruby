require 'board'
require 'limelight_game'
require 'game'

module Board
  
  def begin_game
    production.game = TTT::Game.new(self)
    production.game.play
  end
  
  def welcome_message
    display_game_in_progress
  end

  def get_details_for_player(n)    
    if n == 1
      return {:type => :computer, :symbol => "X"}
    else
      return {:type => :computer, :symbol => "O"}
    end
  end
  
  def display_instructions
    update_display("Click in a square to move")
  end
  
  def display_board(board)
    index = 0
    (1..9).to_a.each do |n|
      space = board.grid.flatten[index]
      scene.find("square#{n}").text = space unless space.class == Fixnum
      index += 1
    end
  end
  
  def prompt_for_next_move
    update_display("Click on your next move")
  end
  
  def get_input    
    return production.human_move if production.human_move != nil
    #should return the move the player clicked
  end
  
  def invalid_move_message
    "Not a valid move. Please try again"
  end
  
  def winning_message(winner)
    update_display("#{winner} Wins!")
  end
  
  def draw_message
    update_display("Tie Game.")
  end
  
  def update_display(string)
    scene.find("display_text").text = " "
    scene.find("display_text").text = string
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
require 'board'
require 'limelight_game'
require 'game'

module Board
  
  def begin_game
    load_players
    production.game = TTT::Game.new(self)
    Thread.new do
      production.game.play
    end
  end
  
  def welcome_message
    display_game_in_progress
  end

  def get_details_for_player(n)
    production.player_values.shift   
  end
  
  def display_instructions
    update_display("Game Starting...")
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
    update_display("Game in Progress")
  end
  
  def get_input    
    return production.human_move unless production.human_move.nil?
    #should return the move the player clicked
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
  
private

  def load_players    
    player1 = Hash.new
    player2 = Hash.new
    player1[:type] = scene.find('first_player').value.downcase.to_sym
    player1[:symbol] = "X"
    player2[:type] = scene.find('second_player').value.downcase.to_sym
    player2[:symbol] = "O"
    production.player_values = [player1,player2]
  end
  
end
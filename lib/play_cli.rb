require 'game'
require 'player_factory'
require 'human_player'
require 'computer_player'

class PlayCli
  
  attr_accessor :game, :ui, :player_factory, :player1, :player2
  
  def initialize(ui)    
    @ui = ui
    @game = TTT::Game.new
    @player_factory = TTT::PlayerFactory.new
  end
  
  def setup_game
    @ui.welcome_message
    set_players
    setup_game_board
    play_game unless exit_game? #exit_game? really just for testing. Should get rid of it
  end
  
  def play_game
    @ui.display_board(@game.current_board)
    next_player_move 
    play_game unless game.is_over?
  end
  
  def next_player_move
    
  end
    
  def set_players
    set_player(1)
    set_player(2)
  end

  def set_player(n)
    input = @ui.get_details_for_player(n)
    if input[:type] == :human
      player = TTT::HumanPlayer.new(input[:symbol], @ui)
    elsif input[:type] == :computer
      player = TTT::ComputerPlayer.new(input[:symbol])
    end
    n == 1 ? @player1 = player : @player2 = player
  end
    
  def setup_game_board
    @game.set_board_symbols(@player1.symbol,@player2.symbol)    
  end
  
  def exit_game?
    @ui.play_again == :no
  end
end

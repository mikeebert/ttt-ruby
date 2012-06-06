require 'game'
require 'human_player'
require 'computer_player'

class PlayCli
  
  attr_accessor :game, :ui, :player_factory, :player1, :player2
  
  def initialize(ui)    
    @ui = ui
    @game = TTT::Game.new
  end
  
  def setup_game
    @ui.welcome_message
    set_players
    setup_game_board
    play_game
  end
  
  def play_game
    until @game.is_over?
      @ui.display_board(@game.current_board)
      next_player_move 
    end
    #game_over_scenario
  end
  
  def next_player_move
    player = next_player
    move = player.get_move(@game.current_board)
    @game.make_move(next_player.symbol, move)
  end
  
  def next_player
    @game.next_player == :player1 ? @player1 : @player2
  end
    
  def set_players
    create_player(1)
    create_player(2)
  end

  def create_player(n)
    input = @ui.get_details_for_player(n)
    if input[:type] == :human
      player = TTT::HumanPlayer.new(input[:symbol], @ui)
    elsif input[:type] == :computer
      player = TTT::ComputerPlayer.new(input[:symbol])
    end
    set_player(n,player)
  end
    
  def set_player(n,player)
    n == 1 ? @player1 = player : @player2 = player
  end
  
  def setup_game_board
    @game.set_board_symbols(@player1.symbol,@player2.symbol)    
  end
  
  def exit_game?
    @ui.play_again == :no
  end
end

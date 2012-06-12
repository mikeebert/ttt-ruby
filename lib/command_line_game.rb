require 'game'
require 'player_factory'

class CommandLineGame
  
  attr_accessor :game, :ui
  attr_accessor :player_factory, :player1, :player2
  
  def initialize(ui)    
    @ui = ui
    @game = TTT::Game.new
    @player_factory = TTT::PlayerFactory.new
  end
  
  def setup_game
    @ui.welcome_message
    set_players
    set_game_symbols
    play_game
  end
  
  def play_game
    until @game.is_over?
      @ui.display_board(@game.current_board)
      next_player_move 
    end
    game_over_scenario
  end
  
  def next_player_move
    player = next_player
    move = get_player_move(player)
    @game.make_move(player.symbol, move)
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
    player = @player_factory.create(input)
    set_player(n,player)
  end
  
  def set_player(n,player)
    n == 1 ? @player1 = player : @player2 = player
  end
  
  def set_game_symbols
    @game.set_game_player_symbols(@player1.symbol,@player2.symbol)
  end
  
  def get_player_move(player)
    if player.human? 
      @ui.get_human_move(moves_left)
    else
      sleep 0.5
      player.get_ai_move(@game.board, player.symbol, @game.opponent_symbol)
    end
  end
    
  def moves_left
    @game.remaining_moves
  end
  
  def game_over_scenario
    @ui.display_board(@game.current_board)
    game_over_message
    ask_to_play_again
    play_again if @ui.play_again == :yes
  end

  def game_over_message
    if @game.winner.nil?
      @ui.draw_message
    else
      @ui.winning_message(@game.winner)
    end    
  end
  
  def ask_to_play_again
    @ui.prompt_to_play_again
  end
  
  def play_again
    @game.reset
    play_game
  end
end

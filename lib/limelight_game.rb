require 'game'
require 'player_factory'

class LimelightGame
  attr_accessor :game, :ui
  attr_accessor :player_factory, :player1, :player2

  def initialize(ui)
    @ui = ui
    @game = TTT::Game.new
    @player_factory = TTT::PlayerFactory.new
  end
  
  def create_players(player1,player2)
    @player1 = @player_factory.create(player1)
    @player2 = @player_factory.create(player2)
    set_game_symbols
  end
  
  def set_game_symbols
    @game.set_game_player_symbols(@player1.symbol,@player2.symbol)
  end
  
  def begin_game
    @ui.display_game_in_progress
    get_computer_move if next_player.human? == false
  end
  
  def update_game(move)
    @game.make_move(@game.next_player_symbol,move) #seems like a mess 
    @ui.display_board(@game.current_board)
    if @game.is_over?
      game_over_message
    else
      get_computer_move if next_player.human? == false
    end
  end
  
  def get_computer_move
    move = next_player.get_ai_move(@game.board, 
                                   @game.next_player_symbol,
                                   @game.opponent_symbol)
    sleep 0.3
    update_game(move)
  end
  
  def next_player
    @game.next_player == :player1 ? @player1 : @player2
  end
  
  def game_over_message
    if @game.winner.nil?
      @ui.draw_message
    else
      @ui.winning_message(@game.winner)
    end    
  end
  
  def reset_game
    @game.reset
    @ui.clear_board
    @ui.prompt_for_new_game
  end      
  
end

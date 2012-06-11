require 'game'
require 'human_player'
require 'computer_player'

class LimelightGame
  attr_accessor :game, :ui
  attr_accessor :player_factory, :player1, :player2

  def initialize(ui, player1, player2)
    @ui = ui
    @game = TTT::Game.new
    @player_factory = TTT::PlayerFactory.new
    create_players(player1, player2)
    setup_game_board
  end
  
  def create_players(player1,player2)
    @player1 = @player_factory.create(player1)
    @player2 = @player_factory.create(player2)
  end
  
  def setup_game_board
    @game.set_game_player_symbols(@player1.symbol,@player2.symbol)
  end
  
  def begin
    @ui.display_game_in_progress
    check_for_computer_move    
  end
  
  def update_game(n)
    @game.make_move(@game.next_player_symbol,n)
    @ui.display_board(@game.current_board)
    if @game.is_over?
      game_over_message
    else
      check_for_computer_move
    end
  end

  def next_player
    @game.next_player == :player1 ? @player1 : @player2
  end
  
  def is_computer?
    next_player.human? == false
  end
  
  def check_for_computer_move
    if next_player.human? == false
      move = next_player.get_ai_move(@game.board, next_player.symbol, @game.opponent_symbol)
      sleep 0.3
      update_game(move)
    end
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
  end      
  
end

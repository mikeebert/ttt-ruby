require 'lib/game.rb'

puts "Welcome to Tic-Tac-Toe. Enter a number corresponding to a position on the board below to make your first move."
@game = Game.new
@game.display_board
move = gets chomp.to_i
player_move(move)

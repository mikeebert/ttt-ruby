$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'
require 'board'

game = Game.new(3)
game.board.human_symbol = "x"
game.board.computer_symbol = "o"

puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board below to make your first move."

game.play
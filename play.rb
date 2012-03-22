$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'

game = Game.new
game.board = Board.new(3)
game.ui = CommandLineInterface.new

game.board.human_symbol = "x"
game.board.computer_symbol = "o"  
game.play

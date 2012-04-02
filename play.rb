$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'

game = Game.new
game.board = Board.new(3)
game.ui = CommandLineInterface.new
game.ai = Ai.new

game.play

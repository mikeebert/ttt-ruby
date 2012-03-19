$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'

game = Game.new(3)
game.board.human_symbol = "x"
game.board.computer_symbol = "o"  
game.play

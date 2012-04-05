$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'

game = Game.new
game.play

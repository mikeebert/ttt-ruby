$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'
require 'commandlineinterface'

ui = CommandLineInterface.new
game = Game.new(ui)
game.play

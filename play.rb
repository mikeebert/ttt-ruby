$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'
require 'commandlineinterface'

ui = TTT::CommandLineInterface.new
game = TTT::Game.new(ui)
game.play

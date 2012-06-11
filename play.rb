$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'command_line_game'
require 'command_line_interface'

ui = CommandLineInterface.new
cli_game = CommandLineGame.new(ui)
cli_game.setup_game

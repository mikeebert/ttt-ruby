$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'play_cli'
require 'commandlineinterface'

ui = CommandLineInterface.new
cli_game = PlayCli.new(ui)
cli_game.setup_game

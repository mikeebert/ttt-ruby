$: << File.expand_path(File.dirname(__FILE__) + "/../../../lib")
# print $: << File.expand_path(File.dirname(__FILE__) + "../../../..")
require 'board'
require 'limelight_ui'

module LimelightBoard
  attr_accessor @board
  
  def scene_opened(event)
    # ui = LimelightUI.new
    #     @game = Game.new(ui)
    @board = Board.new(3)
    production.player = 1
  end
  
end
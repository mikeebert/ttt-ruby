$: << File.expand_path(File.dirname(__FILE__) + "/../../../lib")
# print $: << File.expand_path(File.dirname(__FILE__) + "../../../..")
require 'game'
require 'limelight_ui'

module LimelightBoard
  
  def scene_opened(event)
    ui = LimelightUI.new
    @game = Game.new(ui)
    production.player = 1
  end
  
end
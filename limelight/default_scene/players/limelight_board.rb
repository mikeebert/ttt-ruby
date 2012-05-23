$: << File.expand_path(File.dirname(__FILE__) + "/../../../lib")
# print $: << File.expand_path(File.dirname(__FILE__) + "../../../..")
require 'board'
require 'limelight_ui'
    
module LimelightBoard
  
  def scene_opened(event)
    # ui = LimelightUI.new
    #     @game = Game.new(ui)
  end
  
end
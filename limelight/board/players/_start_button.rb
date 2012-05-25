require 'board'
require 'limelight_game'

module StartButton
  def mouse_clicked(event)
    scene.begin_game
  end
end




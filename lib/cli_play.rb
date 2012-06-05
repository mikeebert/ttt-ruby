require 'game'

class CliPlay
  
  attr_accessor :game, :ui
  
  def initialize(ui)
    @game = TTT::Game.new
    @ui = ui
  end
  
  
end
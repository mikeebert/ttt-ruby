require 'player'
require 'human_player'
require 'computer_player'

class PlayerFactory
  def self.create(input, ui)
    if input[:type] == :human
      player = HumanPlayer.new(input[:symbol], ui)
    else
      player = ComputerPlayer.new(input[:symbol])
    end
    return player
  end  
end
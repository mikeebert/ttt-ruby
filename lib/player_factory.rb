require 'player'
require 'human_player'
require 'computer_player'

class PlayerFactory
  def self.create(input)
    if input[:type] == :human
      HumanPlayer.new(input[:symbol])
    else
      ComputerPlayer.new(input[:symbol])
    end
  end  
end
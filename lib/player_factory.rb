require 'human_player'
require 'computer_player'

module TTT
  class PlayerFactory
    def create(input)
      if input[:type] == :human
        player = HumanPlayer.new(input[:symbol])
      elsif input[:type] == :computer
        player = ComputerPlayer.new(input[:symbol])
      end
      return player
    end  
  end
end
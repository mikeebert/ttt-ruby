require 'player'
require 'human_player'
require 'computer_player'
# require './spec/mocks/mock_player.rb'

module TTT
  class PlayerFactory
    def create(input)
      if input[:type] == :human
        player = HumanPlayer.new(input[:symbol])
      elsif input[:type] == :computer
        player = ComputerPlayer.new(input[:symbol])
      else
        player = FakePlayer.new
      end
      return player
    end  
  end
end
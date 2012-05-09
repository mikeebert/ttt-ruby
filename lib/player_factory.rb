require 'player'
require 'human_player'
require 'computer_player'
require './spec/mocks/mock_player.rb'

class PlayerFactory
  def create(input, ui)
    if input[:type] == :human
      player = HumanPlayer.new(input[:symbol], ui)
    elsif input[:type] == :computer
      player = ComputerPlayer.new(input[:symbol])
    else
      player = FakePlayer.new
    end
    return player
  end  
end
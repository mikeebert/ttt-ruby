class MockPlayerFactory
  attr_accessor :player1_type, :player1_symbol,
                :player2_type, :player2_symbol,
                :ui
  
  def create(input_hash)
    if @player1_type.nil?
      @player1_type = input_hash[:type]
      @player1_symbol = input_hash[:symbol]
    else
      @player2_type = input_hash[:type]
      @player2_symbol = input_hash[:symbol]
    end
    return MockPlayer.new(input_hash[:symbol], input_hash[:type])
  end
  
end

class MockPlayer
  attr_accessor :symbol, :human, :got_computer_move
  
  def initialize(symbol, type)
    @symbol = symbol
    type == :human ? @human = true : @human = false
  end
  
  def human?
    @human
  end
  
  def get_ai_move(board, player, opponent)
    @got_computer_move = true
  end
end